import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:gvinum_travel/app/modules/home/views/home_view.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginPageController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/login.jpg"),
          ),
          color: AllMaterial.colorBlack,
        ),
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login ke akun Anda!",
                    style: AllMaterial.inter(
                      color: AllMaterial.colorWhite,
                      fontSize: 28,
                      fontWeight: AllMaterial.fontBold,
                    ),
                  ),
                  Text(
                    "Selamat datang! Silahkan isi data diri.",
                    style: AllMaterial.inter(
                      color: AllMaterial.colorGreySec,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    selectionControls: MaterialTextSelectionControls(),
                    controller: loginController.userC,
                    focusNode: loginController.userF,
                    cursorColor: AllMaterial.colorWhite,
                    textInputAction: TextInputAction.next,
                    onTapOutside: (_) {
                      loginController.userF.unfocus();
                    },
                    style: AllMaterial.inter(
                      color: AllMaterial.colorWhite,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AllMaterial.colorWhite.withOpacity(0.4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hoverColor: AllMaterial.colorWhite,
                      labelText: "Username",
                      labelStyle: AllMaterial.inter(
                        color: AllMaterial.colorWhite,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AllMaterial.colorWhite.withOpacity(0.4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: AllMaterial.colorWhite,
                      filled: true,
                      fillColor: AllMaterial.colorWhite.withOpacity(0.04),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextField(
                      selectionControls: MaterialTextSelectionControls(),
                      controller: loginController.passC,
                      focusNode: loginController.passF,
                      cursorColor: AllMaterial.colorWhite,
                      textInputAction: TextInputAction.done,
                      obscureText: loginController.isPasswordHidden.value,
                      onTapOutside: (e) {
                        loginController.passF.unfocus();
                      },
                      style: AllMaterial.inter(
                        color: AllMaterial.colorWhite,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AllMaterial.colorWhite.withOpacity(0.4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hoverColor: AllMaterial.colorWhite,
                        labelText: "Password",
                        labelStyle: AllMaterial.inter(
                          color: AllMaterial.colorWhite,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AllMaterial.colorWhite.withOpacity(0.4),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusColor: AllMaterial.colorWhite,
                        filled: true,
                        fillColor: AllMaterial.colorWhite.withOpacity(0.04),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.isPasswordHidden.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          onPressed: loginController.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      AllMaterial.cusButton(
                        label: "Login",
                        onTap: () {
                          Get.to(() => const HomeView());
                          // AllMaterial.messageScaffold(
                          //   title:
                          //       "Permintaan tidak valid. Periksa input Anda!",
                          // );
                        },
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ForgotPasswordView());
                          print("aku tau kau juga melihat aku...");
                        },
                        child: Text(
                          "Forgot Password",
                          style: AllMaterial.inter(
                              color: AllMaterial.colorGreySec,
                              decoration: TextDecoration.underline,
                              decorationColor: AllMaterial.colorWhite),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
