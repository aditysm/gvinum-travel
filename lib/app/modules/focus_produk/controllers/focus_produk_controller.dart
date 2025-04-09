import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/detail_package_model.dart';
import 'package:http/http.dart' as http;

class FocusProdukController extends GetxController {
  var selectedPacket = ''.obs;
  var selectedRoom = ''.obs;
  var token = AllMaterial.box.read("token");
  var package = Rx<DetailPackageModel?>(null);
  var namaPaket = ["SILVER", "GOLD", "PREMIUM"];
  var namaKamar = ["QUAD", "DOUBLE", "TRIPLE"];

  Future<void> fetchDetailPackage(int? id) async {
    print("fetch detail package dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllPackage}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = DetailPackageModel.fromJson(data);
        package.value = responseData;
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  void toggleSelection(String value) {
    if (selectedPacket.value == value) {
      selectedPacket.value = '';
    } else {
      selectedPacket.value = value;
    }
    update();
  }

  @override
  void onInit() {
    fetchDetailPackage(Get.arguments["idPackage"]);
    super.onInit();
  }
}
