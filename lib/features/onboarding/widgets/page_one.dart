import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.appWidth,
      height: AppConst.appHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "Todo's in Twos",
            style: customTextStyle(32, AppConst.prLight, FontWeight.w700),
          ),
          HeightSpacer(ht: 50),
          Image.asset("assets/images/list.png"),
          HeightSpacer(ht: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "Ceate shareable to-do lists with accountability at its core.",
              textAlign: TextAlign.center,
              style: customTextStyle(18, AppConst.prLight, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
