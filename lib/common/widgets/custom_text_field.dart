import 'package:dogether/common/utils/constants.dart';
import 'package:dogether/common/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.keyboardType,
      required this.controller,
      required this.onChanged,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconColor,
      this.hintStyle});

  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.appWidth * 0.7,
      decoration: BoxDecoration(
        color: AppConst.prLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConst.appRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          cursorHeight: 25,
          onChanged: onChanged,
          cursorColor: AppConst.prDark,
          style: customTextStyle(18, AppConst.prDark, FontWeight.normal),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
            hintStyle: hintStyle,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
