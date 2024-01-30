import 'package:dogether/common/models/list_model.dart';
import 'package:dogether/common/models/task_model.dart';
import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_button.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_field.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:dogether/features/dogether/controllers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({this.myList, this.lid, super.key});

  final ListModel? myList;
  final String? lid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController taskName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final listId = int.parse(widget.lid!.substring(1));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppConst.prLight),
            onPressed: () => context.pop(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: "Add a new task",
                style: customTextStyle(32, AppConst.prLight, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: ListView(
          children: [
            HeightSpacer(ht: 40.h),
            CustomTextField(
              controller: taskName,
              hintText: "New Task",
              keyboardType: TextInputType.name,
            ),
            HeightSpacer(ht: 20.h),
            CustomButton(
                onTap: () {
                  if (taskName.text.isNotEmpty) {
                    TaskModel task = TaskModel(
                      title: taskName.text,
                      desc: taskName.text,
                      isCompleted: 0,
                      date: DateTime.now().toString().substring(0, 10),
                      listId: listId,
                      ownerId: 1,
                    );
                    ref.read(taskStateProvider.notifier).addTask(task, listId);
                    context.pop();
                  }
                },
                width: AppConst.appWidth * 0.8,
                height: AppConst.appHeight * 0.07,
                bgColor: AppConst.secTan,
                text: "Add task")
          ],
        ),
      ),
    );
  }
}
