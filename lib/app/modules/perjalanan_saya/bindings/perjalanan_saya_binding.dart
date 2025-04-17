import 'package:get/get.dart';

import '../controllers/perjalanan_saya_controller.dart';

class PerjalananSayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerjalananSayaController>(
      () => PerjalananSayaController(),
    );
  }
}
