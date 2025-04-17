import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/list_rombongan_model.dart';
import 'package:http/http.dart' as http;

class ListRombonganController extends GetxController {
  var rombongan = Rx<ListRombonganModel?>(null);
  var token = AllMaterial.box.read("token");
  var countFilled = 0.obs;
  var countBooking = 0.obs;
  var countAvailable = 0.obs;

  Future<void> fetchListRombongan(int idPackage) async {
    print("fetch list rombongan dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetUserPackageRombongan}/$idPackage"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = ListRombonganModel.fromJson(data);
        rombongan.value = responseData;
        countFilled.value = data["data"]["count_filled"];
        countBooking.value = data["data"]["count_booking"];
        countAvailable.value = data["data"]["count_available"];
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  @override
  void onInit() async {
    print("object: ${Get.arguments["idPackage"]}");
    await fetchListRombongan(Get.arguments["idPackage"]);
    super.onInit();
  }
}
