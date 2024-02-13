import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.icon,
    required this.press,
  });

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
