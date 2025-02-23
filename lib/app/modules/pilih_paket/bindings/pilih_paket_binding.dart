import 'package:get/get.dart';

import '../controllers/pilih_paket_controller.dart';

class PilihPaketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihPaketController>(
      () => PilihPaketController(),
    );
  }
}
