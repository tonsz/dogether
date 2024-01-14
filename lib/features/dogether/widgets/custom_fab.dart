import 'package:dogether/common/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppConst.secTan,
        foregroundColor: AppConst.prLight,
        child: const Icon(Icons.add),
      ),
    );
  }
}
