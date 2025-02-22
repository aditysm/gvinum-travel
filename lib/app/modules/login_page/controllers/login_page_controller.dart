import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  var isPasswordHidden = true.obs;
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode userF = FocusNode();
  FocusNode passF = FocusNode();
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
