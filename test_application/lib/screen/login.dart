import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_application/widgets/no_account_text.dart';
import 'package:test_application/widgets/sign_form.dart';
import 'package:test_application/widgets/social_card.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Sign in with your email and password \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const SignForm(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "lib/assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "lib/assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "lib/assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const NoAccountText()
              ],
            )),
          ),
        ),
      ),
    );
  }
}
