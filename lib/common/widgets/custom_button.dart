import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    this.onTap,
    required this.bgColor,
    required this.text,
  });

  final double width;
  final double height;
  final void Function()? onTap;
  final Color bgColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomText(
            text: text,
            style: customTextStyle(24, AppConst.prLight, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
