import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/detail_package_model.dart';
import 'package:gvinum_travel/app/model/package_booking_price_model.dart';
import 'package:gvinum_travel/app/model/package_rating_model.dart';
import 'package:http/http.dart' as http;

class FocusProdukController extends GetxController {
  var paketDipilih = 'SILVER'.obs;
  var kamarDipilih = 'QUAD'.obs;
  var jumlahBangku = 0.obs;
  var hargaPaket = 0.obs;
  var totalPaketDipilih = 1.obs;
  var token = AllMaterial.box.read("token");
  var package = Rx<DetailPackageModel?>(null);
  var price = Rx<PackageBookingPriceModel?>(null);
  var rating = Rx<PackageRatingModel?>(null);
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
        fetchPackageRating(id);
        fetchPackagePrice();
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  Future<void> fetchPackagePrice() async {
    print("fetch package price dijalankan...");
    try {
      final response = await http.get(
        Uri.parse(
            "${ApiUrl.urlGetBookingPrice}${Get.arguments["idPackage"]}?package_type=${paketDipilih.value}&room_type=${kamarDipilih.value}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = PackageBookingPriceModel.fromJson(data);
        price.value = responseData;
        jumlahBangku.value = responseData.data?.packagePrice?.seatCount ?? 0;
        kamarDipilih.value =
            responseData.data?.packagePrice?.roomType ?? kamarDipilih.value;
        paketDipilih.value =
            responseData.data?.packagePrice?.packageType ?? paketDipilih.value;
        hargaPaket.value = responseData.data?.packagePrice?.price?.toInt() ?? 0;
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

  int totalHarga(int harga, int totalPaket) {
    var totalAkhir = harga * totalPaket;
    return totalAkhir;
  }

  void toggleSelection(String value) {
    if (paketDipilih.value == value) {
      paketDipilih.value = '';
    } else {
      paketDipilih.value = value;
    }
    update();
  }

  @override
  void onInit() {
    fetchDetailPackage(Get.arguments["idPackage"]);
    super.onInit();
  }
}
