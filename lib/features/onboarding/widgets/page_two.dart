import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_button.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
          HeightSpacer(ht: 50.h),
          Image.asset("assets/images/rocket.png"),
          HeightSpacer(ht: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "Just lists and no more!",
              textAlign: TextAlign.center,
              style: customTextStyle(18, AppConst.prLight, FontWeight.normal),
            ),
          ),
          HeightSpacer(ht: 25.h),
          CustomButton(
            width: AppConst.appWidth * 0.7,
            height: 50.h,
            bgColor: AppConst.secTan,
            onTap: () {
              context.go('/login');
            },
            text: "Get Started",
          ),
        ],
      ),
    );
  }
}
