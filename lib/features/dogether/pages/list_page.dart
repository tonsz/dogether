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
      body: MyTasks(),
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
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> tasksData = ref.watch(taskStateProvider);

    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 40,
      ),
      itemCount: tasksData.length,
      itemBuilder: (context, index) {
        final data = tasksData[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: OutlinedBox(
            onTap: () {},
            height: AppConst.appHeight * 0.1,
            child: TaskTitle(
              taskName: data.title,
              taskDate: data.date,
            ),
          ),
        );
      },
    );
  }
}
