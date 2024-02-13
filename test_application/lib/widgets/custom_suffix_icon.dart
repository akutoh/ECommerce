import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({super.key, required this.svgIcon});

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SvgPicture.asset(
        svgIcon,
        height: 16,
        width: 16,
      ),
    );
  }
}
