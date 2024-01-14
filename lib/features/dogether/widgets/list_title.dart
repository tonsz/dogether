import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTitle extends StatelessWidget {
  const ListTitle(
      {super.key,
      required this.listName,
      required this.listDate,
      required this.listStatus});

  final String listName;
  final String listDate;
  final String listStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomText(
                text: listName,
                style: customTextStyle(20, AppConst.prLight, FontWeight.bold),
              ),
              HeightSpacer(ht: 5.h),
              const Row(
                children: [
                  SizedBox(),
                  SizedBox(),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: listDate,
                style: customTextStyle(14, AppConst.secGold, FontWeight.normal),
              ),
              HeightSpacer(ht: 5.h),
              CustomText(
                text: listStatus,
                style: customTextStyle(14, AppConst.secGold, FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}
