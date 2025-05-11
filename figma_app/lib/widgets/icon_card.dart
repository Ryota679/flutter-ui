import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconCard extends StatelessWidget {
  final String iconPath;
  final String label;

  const IconCard({required this.iconPath, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 40,
          height: 40,
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
