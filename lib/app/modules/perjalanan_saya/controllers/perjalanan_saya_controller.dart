import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/detail_package_booking_model.dart';
import 'package:gvinum_travel/app/model/package_rating_model.dart';
import 'package:http/http.dart' as http;

class PerjalananSayaController extends GetxController {
  var selectedPacket = ''.obs;
  var selectedRoom = ''.obs;
  var token = AllMaterial.box.read("token");
  var package = Rx<DetailPackageBookingModel?>(null);
  var rating = Rx<PackageRatingModel?>(null);
  var status = "".obs;
  var namaPaket = ["SILVER", "GOLD", "PREMIUM"];
  var namaKamar = ["QUAD", "DOUBLE", "TRIPLE"];

  void toggleSelection(String value) {
    if (selectedPacket.value == value) {
      selectedPacket.value = '';
    } else {
      selectedPacket.value = value;
    }
    update();
  }

  Future<void> fetchDetailPackage(int? id) async {
    print("fetch detail package dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetPackageBookingById}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = DetailPackageBookingModel.fromJson(data);
        package.value = responseData;
        fetchPackageRating(id);
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  Future<void> fetchPackageRating(int? id) async {
    print("fetch package rating dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetPackageRating}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = PackageRatingModel.fromJson(data);
        rating.value = responseData;
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
  void onInit() {
    fetchDetailPackage(Get.arguments["idBooking"]);
    status.value = Get.arguments["statusPackage"];
    super.onInit();
  }
}
