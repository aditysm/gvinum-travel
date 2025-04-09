import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:gvinum_travel/app/model/booking_package_model.dart';

class PilihanPerjalananController extends GetxController {
  var perjalanan = Rxn<BookingPackageModel?>(null);
  var token = AllMaterial.box.read("token");
  var diprosesList = <Datum>[].obs;
  var dibatalkanList = <Datum>[].obs;
  var dikonfirmasiList = <Datum>[].obs;

  void updateLists() {
    var data = perjalanan.value?.data ?? [];

    diprosesList.value =
        data.where((element) => element.status == "PENDING").toList();
    dibatalkanList.value =
        data.where((element) => element.status == "CANCELLED").toList();
    dikonfirmasiList.value =
        data.where((element) => element.status == "CONFIRMED").toList();
  }

  Future<void> fetchBookingPackage() async {
    print("fetch package dijalankan...");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetUserBooking),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = BookingPackageModel.fromJson(data);
        perjalanan.value = responseData;
        updateLists();
      } else {
        print(data);
      }
    } catch (e) {
      print("$e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchBookingPackage();
  }
}
