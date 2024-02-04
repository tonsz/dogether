import 'package:dogether/common/models/list_model.dart';
import 'package:dogether/common/models/task_model.dart';
import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_outlined_box.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:dogether/features/dogether/controllers/task_provider.dart';
import 'package:dogether/features/dogether/widgets/custom_fab.dart';
import 'package:dogether/features/dogether/widgets/task_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key, this.lid, this.myList});

  final ListModel? myList;
  final String? lid;

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    final listId = int.parse(widget.lid!.substring(1));
    ref.watch(taskStateProvider.notifier).refresh(listId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppConst.prLight),
            onPressed: () => context.pop(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: CustomText(
                    text: widget.myList!.name.toString(),
                    style:
                        customTextStyle(32, AppConst.prLight, FontWeight.bold),
                  ),
                ),
                HeightSpacer(ht: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppConst.secGold,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppConst.appRadius),
                    ),
                  ),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppConst.prGray,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.appRadius)),
                    ),
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelColor: Colors.transparent,
                    unselectedLabelColor: AppConst.secGold,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConst.appWidth * 0.5,
                          child: Center(
                            child: CustomText(
                              text: "Pending",
                              style: customTextStyle(
                                  16, AppConst.prLight, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: AppConst.appWidth * 0.5,
                          child: Center(
                            child: CustomText(
                              text: "Completed",
                              style: customTextStyle(
                                  16, AppConst.prLight, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: tabController,
          children: const [
            MyTasks(status: 0),
            MyTasks(status: 1),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => context.push(
          '/add_task/:$listId',
          extra: widget.myList,
        ),
      ),
    );
  }
}

class MyTasks extends ConsumerWidget {
  const MyTasks({
    this.status,
    super.key,
  });

  final int? status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> tasksData = ref.watch(taskStateProvider);

    var tasks =
        tasksData.where((element) => element.isCompleted == status).toList();

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 10,
        left: 40,
        right: 40,
        bottom: 40,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final data = tasks[index];
        bool isCompleted = ref.read(taskStateProvider.notifier).getStatus(data);

        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            child: Slidable(
              startActionPane: ActionPane(
                extentRatio: 0.25,
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      ref
                          .read(taskStateProvider.notifier)
                          .deleteTask(data.id!, data.listId!);
                    },
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppConst.secTan,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: OutlinedBox(
                onTap: () {},
                height: AppConst.appHeight * 0.1,
                child: TaskTitle(
                  taskName: data.title,
                  taskDate: data.date,
                  switcher: status == 0
                      ? Checkbox(
                          shape: const CircleBorder(),
                          value: isCompleted,
                          onChanged: (bool? value) {
                            ref.read(taskStateProvider.notifier).changeStatus(
                                data.id!,
                                data.title!,
                                data.desc!,
                                data.isCompleted!,
                                data.date!,
                                data.ownerId!,
                                data.listId!);
                          },
                        )
                      : Checkbox(
                          shape: const CircleBorder(),
                          value: true,
                          onChanged: (value) {},
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
