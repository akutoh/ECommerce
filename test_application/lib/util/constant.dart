// Form Error
import 'package:flutter/material.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please enter your email";
const String invalidEmailError = "Please enter valid email";
const String passNullError = "Please enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Password not match";
const String nameNullError = "Please enter your name";
const String phoneNumberNullError = "Please enter your phone number";
const String addressNullError = "Please enter your address";

// Colors
const primaryColor = Color(0xFFFF7643);
const textColor = Colors.black;