import 'package:get/get.dart';

import '../controllers/jadwal_manasik_controller.dart';

class JadwalManasikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalManasikController>(
      () => JadwalManasikController(),
    );
  }
}
