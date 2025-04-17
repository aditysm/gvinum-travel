import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/detail_package_model.dart';
import 'package:gvinum_travel/app/model/package_booking_price_model.dart';
import 'package:gvinum_travel/app/model/package_rating_model.dart';
import 'package:gvinum_travel/app/modules/home/views/home_view.dart';
import 'package:http/http.dart' as http;

class FocusProdukController extends GetxController {
  var paketDipilih = 'SILVER'.obs;
  var kamarDipilih = 'QUAD'.obs;
  var jumlahBangku = 0.obs;
  var hargaPaket = 0.obs;
  var totalAkhir = 0.obs;
  var detilPaket = "-".obs;
  var idPackagePrice = 0.obs;
  var totalPaketDipilih = 1.obs;
  var token = AllMaterial.box.read("token");
  var package = Rx<DetailPackageModel?>(null);
  var price = Rx<PackageBookingPriceModel?>(null);
  var rating = Rx<PackageRatingModel?>(null);
  var namaPaket = ["SILVER", "GOLD", "PREMIUM"];
  var namaKamar = ["QUAD", "DOUBLE", "TRIPLE"];
  var msg = "".obs;
  var idPackage = int.tryParse(Get.arguments["idPackage"].toString()) ?? 0;

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

  Future<void> postBookingPackage() async {
    print("post booking package dijalankan...");
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.urlPostBookingPackage),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(
          {
            "package_id": idPackage,
            "packages_price_id": idPackagePrice.value,
            "total_price": totalAkhir.value.toDouble(),
            "count": totalPaketDipilih.value,
          },
        ),
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        postNewMessageToAdmin();
        AllMaterial.messageScaffold(
          title:
              "Pesanan berhasil diproses, silahkan hubungi admin untuk melanjutkan pembayaran!",
        );
        print(data);
      } else {
        msg.value = data["msg"];
        AllMaterial.messageScaffold(
          title: AllMaterial.getErrorMessage(data["msg"]),
        );
        print(data);
      }
      update();
    } catch (e) {
      print("$e: post booking");
    }
  }

  Future<void> postNewMessageToAdmin() async {
    print("post new message dijalankan...");
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.urlPostPackageeMessage),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(
          {
            "receiver_id": package.value?.data?.user?.id,
            "package_id": package.value?.data?.id,
            "message": "Saya ingin memesan paket ini, bagaimana pembayarannya?",
          },
        ),
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.offAll(
          () => const HomeView(),
        );
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
            "${ApiUrl.urlGetBookingPrice}$idPackage?package_type=${paketDipilih.value}&room_type=${kamarDipilih.value}"),
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
        totalAkhir.value = responseData.data?.packagePrice?.price?.toInt() ?? 0;
        totalPaketDipilih.value = 1;
        detilPaket.value = responseData.data?.packagePrice?.detail ?? "-";
        idPackagePrice.value = idPackagePrice.value = int.tryParse(
                responseData.data?.packagePrice?.id.toString() ?? '0') ??
            0;
        print(data);
        print(totalAkhir.value);
        msg.value = "";
      } else {
        msg.value = "";
        totalAkhir.value = 0;
        jumlahBangku.value = 0;
        totalPaketDipilih.value = 1;
        detilPaket.value = "-";
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

  int hitungTotal(int harga, int totalPaket) {
    var totalAkhirPaket = harga * totalPaket;
    totalAkhir.value = totalAkhirPaket;
    update();
    return totalAkhirPaket;
  }

  int kurangTotal(int totalPaket) {
    var totalAkhirPaket = totalAkhir.value - hargaPaket.value;
    totalAkhir.value = totalAkhirPaket;
    update();
    return totalAkhirPaket;
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
    idPackage = int.tryParse(Get.arguments["idPackage"].toString()) ?? 0;

    fetchDetailPackage(idPackage);
    super.onInit();
  }
}
