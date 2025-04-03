import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/list_package_model.dart';

import 'package:http/http.dart' as http;

class PilihPaketController extends GetxController {
  var token = AllMaterial.box.read("token");
  var package = Rxn<ListPackageModel?>(null);

  Future<void> fetchDataPackage() async {
    print("fetch data package dijalankan...");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllPackage),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = ListPackageModel.fromJson(data);
        package.value = responseData;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  @override
  void onInit() {
    fetchDataPackage();
    super.onInit();
  }
}
