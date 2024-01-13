import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({super.key, required this.ht});

  final double ht;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ht);
  }
}
