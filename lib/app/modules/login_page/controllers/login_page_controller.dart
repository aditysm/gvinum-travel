import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/modules/home/controllers/home_controller.dart';
import 'package:gvinum_travel/app/modules/home/views/home_view.dart';
import 'package:http/http.dart' as http;
import 'package:gvinum_travel/all_material.dart';

class LoginPageController extends GetxController {
  var isPasswordHidden = true.obs;
  var isAuth = false.obs;
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode userF = FocusNode();
  FocusNode passF = FocusNode();
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<dynamic> login(String email, String password) async {
    try {
      if (userC.text.isEmpty || passC.text.isEmpty) {
        AllMaterial.messageScaffold(
          title: "Email atau Password tidak boleh kosong!",
        );
        return;
      }

      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            backgroundColor: AllMaterial.colorPrimary,
            color: AllMaterial.colorSoftPrimary,
          ),
        ),
        barrierDismissible: false,
      );

      final response = await http.post(
        Uri.parse(ApiUrl.urlPostLogin),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );

      Get.back();
      var data = jsonDecode(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        var token = data["data"]["access_token"];
        AllMaterial.box.write("username", userC.text);
        AllMaterial.box.write("password", passC.text);
        AllMaterial.box.write("token", token);
        isAuth.value = true;
        Get.off(() => const HomeView());
        Get.put(HomeController());
        AllMaterial.messageScaffold(
            title: "Verifikasi berhasil, selamat datang!");
      } else {
        String jsonResponse = response.body;
        String message = "";

        Map<String, dynamic> parsedJson = json.decode(jsonResponse);

        if (parsedJson.containsKey('detail')) {
          List<dynamic> details = parsedJson['detail'];
          if (details.isNotEmpty) {
            message = details[0]['msg'];
            print('Error Message: $message');
          }
        }
        response.statusCode == 422
            ? AllMaterial.messageScaffold(
                title: message,
              )
            : AllMaterial.messageScaffold(
                title: data["msg"],
              );
      }
      update();
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      AllMaterial.messageScaffold(
        title: "Terjadi kesalahan: ${e.toString()}",
      );
      throw Exception(e.toString());
    }
  }

  void checkAuthentication() {
    var token = AllMaterial.box.read("token");
    print("token: $token");

    if (token != null && token != "") {
      isAuth.value = true;
    } else {
      isAuth.value = false;
    }
    update();
  }
}
