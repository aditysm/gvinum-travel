import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/list_package_model.dart';
import 'package:gvinum_travel/app/model/user_model.dart';
import 'package:gvinum_travel/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:gvinum_travel/app/modules/pilihan_perjalanan/controllers/pilihan_perjalanan_controller.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final loginC = Get.put(LoginPageController());
  final perjalanan = Get.put(PilihanPerjalananController());
  var token = AllMaterial.box.read("token");
  var user = Rx<UserModel?>(null);
  var unreadCount = 0.obs;
  var package = Rxn<ListPackageModel?>(null);

  Future<void> fetchDataUser() async {
    print("fetch data dijalankan...");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetUser),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = UserModel.fromJson(data);
        user.value = responseData;
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  Future<void> fetchNotifCount() async {
    print("fetch notif count dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetUser}notification/unread/count"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        unreadCount.value = data["data"]["count"] ?? 0;
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

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
        var limitedData = responseData.data?.take(3).toList();

        package.value = ListPackageModel(data: limitedData);

        print("Data package (maks 3): $limitedData");
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  @override
  void onInit() {
    loginC.passC.text = "";
    loginC.userC.text = "";
    fetchDataUser();
    fetchNotifCount();
    fetchDataPackage();
    super.onInit();
  }
}
