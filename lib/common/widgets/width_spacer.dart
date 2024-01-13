import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.wt});

  final double wt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: wt);
  }
}
