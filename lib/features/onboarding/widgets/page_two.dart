import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.appWidth,
      height: AppConst.appHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Be productive, together.",
              textAlign: TextAlign.center,
              style: customTextStyle(32, AppConst.prLight, FontWeight.w700),
            ),
          ),
          HeightSpacer(ht: 50),
          Image.asset("assets/images/rocket.png"),
          HeightSpacer(ht: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "Just lists and no more!",
              textAlign: TextAlign.center,
              style: customTextStyle(18, AppConst.prLight, FontWeight.normal),
            ),
          ),
          HeightSpacer(ht: 25),
          Container(
            height: 50,
            width: AppConst.appWidth * 0.7,
            decoration: BoxDecoration(
              color: AppConst.secTan,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: GestureDetector(
                onTap: null,
                child: CustomText(
                  text: "Get started",
                  style: customTextStyle(24, AppConst.prLight, FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
