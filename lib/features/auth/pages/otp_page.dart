import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:dogether/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeightSpacer(ht: 170.h),
          Center(
            child: Image.asset('assets/images/peace.png'),
          ),
          HeightSpacer(ht: 40.h),
          CustomText(
            text: "Enter your OTP",
            style: customTextStyle(28, AppConst.prLight, FontWeight.bold),
          ),
          HeightSpacer(ht: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Pinput(
              length: 6,
            ),
          )
        ],
      ),
    );
  }
}
