import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:dogether/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle(
      {super.key,
      this.taskName,
      this.assignedTo,
      this.taskDate,
      this.switcher});

  final String? taskName;
  final String? assignedTo;
  final String? taskDate;
  final Widget? switcher;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: taskName ?? "Task Name",
                style: customTextStyle(18, AppConst.prLight, FontWeight.bold),
              ),
              HeightSpacer(ht: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppConst.prGray,
                    ),
                  ),
                  WidthSpacer(wt: 5),
                  CustomText(
                      text: "${assignedTo ?? ""}  |  ${taskDate ?? ""}",
                      style: customTextStyle(
                          12, AppConst.prLight, FontWeight.normal)),
                ],
              )
            ],
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: switcher ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
