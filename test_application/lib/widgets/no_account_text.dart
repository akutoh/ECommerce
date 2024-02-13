import 'package:flutter/material.dart';
import 'package:test_application/util/constant.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: primaryColor),
          ),
        )
      ],
    );
  }
}
