import 'package:flutter/material.dart';
import 'package:test_application/util/constant.dart';
import 'package:test_application/util/keyboard.dart';
import 'package:test_application/widgets/custom_suffix_icon.dart';
import 'package:test_application/widgets/form_error.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) {
              email = newValue;
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: emailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: invalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: emailNullError);
                return;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: invalidEmailError);
                return;
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  CustomSuffixIcon(svgIcon: "lib/assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: passNullError);
              } else if (value.length >= 8) {
                removeError(error: shortPassError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: passNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: shortPassError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  CustomSuffixIcon(svgIcon: "lib/assets/icons/Lock.svg"),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: primaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                child: const Text("Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),),
              ),
            ],
          ),
          FormError(errors: errors),
          const SizedBox(height: 16,),
          ElevatedButton(onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              KeyboardUtil.hideKeyboard(context);
              //Navigator.pushNamed(context, routeName)
            }
          }, child: const Text("Continue"))
        ],
      ),
    );
  }
}
