import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/all_notification_model.dart';
import 'package:gvinum_travel/app/modules/home_page/controllers/home_controller.dart';

import 'package:http/http.dart' as http;

class NotifikasiController extends GetxController {
  var token = AllMaterial.box.read("token");
  var allNotifikasi = Rxn<AllNotificationModel?>(null);
  var home = Get.find<HomeController>();

  Future<void> fetchNotification() async {
    print("fetch data dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetUser}notification"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        allNotifikasi.value = AllNotificationModel.fromJson(data);
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  Future<void> postReadChat(int? id) async {
    print("post read chat dijalankan...");
    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.urlGetUser}notification/read/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.statusCode);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        fetchNotification();
      } else {
        print(data);
      }
    } catch (e) {
      print("${e}dawdwdw");
    }
  }

  @override
  void onClose() {
    home.fetchNotifCount();
    super.onClose();
  }

  @override
  void onInit() {
    fetchNotification();
    super.onInit();
  }
}
