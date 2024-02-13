import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class FormError extends StatelessWidget {
  const FormError({super.key, required this.errors});

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: errors[index]!),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "lib/assets/icons/Error.svg",
          height: 16,
          width: 16,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(error)
      ],
    );
  }
}
