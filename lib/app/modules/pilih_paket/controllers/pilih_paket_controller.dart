import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/list_package_model.dart';

import 'package:http/http.dart' as http;

class PilihPaketController extends GetxController {
  var token = AllMaterial.box.read("token");
  var package = Rxn<ListPackageModel?>(null);
  var filteredPackage = Rxn<ListPackageModel?>(null);
  TextEditingController searchC = TextEditingController();
  var tanggalKeberangkatan = "".obs;
  FocusNode searchF = FocusNode();
  var isFilterActive = false.obs;

  // Method untuk mengambil data paket
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
        filteredPackage.value = responseData;
        print(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  void applyFilter() {
    final keyword = searchC.text.toLowerCase();
    final allData = package.value?.data ?? [];

    final filtered = allData.where((element) {
      final packageName = element.package?.name?.toLowerCase() ?? '';
      return packageName.contains(keyword);
    }).toList();

    filteredPackage.value = ListPackageModel(data: filtered);
    isFilterActive.value = true;
  }

  // Method untuk menghapus filter
  void removeFilter() {
    isFilterActive.value = false;
    filteredPackage.value = package.value;
  }

  @override
  void onInit() {
    fetchDataPackage();
    super.onInit();
  }
}
