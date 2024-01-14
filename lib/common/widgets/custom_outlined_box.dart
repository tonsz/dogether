import 'package:dogether/common/utils/constants.dart';
import 'package:flutter/material.dart';

class OutlinedBox extends StatelessWidget {
  const OutlinedBox({super.key, required this.child, this.onTap});

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppConst.appWidth * 0.9,
        height: AppConst.appHeight * 0.1,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: AppConst.secTan,
          ),
          borderRadius: BorderRadius.circular(AppConst.appRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: child,
        ),
      ),
    );
  }
}
