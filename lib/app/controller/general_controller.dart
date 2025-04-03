import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/login_page/views/login_page_view.dart';
import 'package:http/http.dart' as http;
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/modules/login_page/controllers/login_page_controller.dart';

class GeneralController extends GetxController {
  var logController = Get.put(LoginPageController());

  Future<dynamic> logout({bool isExpired = false}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.urlPostLogout),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.reloadAll();
        Get.back();

        // ALL
        Get.offAll(() => const LoginPageView());
        AllMaterial.box.erase();
        AllMaterial.box.remove("token");
        if (isExpired == true) {
          AllMaterial.messageScaffold(
            title: "Sesi berakhir, silahkan login kembali",
          );
        } else {
          AllMaterial.messageScaffold(
            title: "Logout Berhasil, Sampai Jumpa!",
          );
        }
        update();
      } else {
        AllMaterial.messageScaffold(
          title: "Kesalahan, tidak dapat melakukan aksi sebelumnya!",
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
