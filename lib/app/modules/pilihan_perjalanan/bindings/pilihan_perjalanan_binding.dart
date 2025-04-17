import 'package:get/get.dart';

import '../controllers/pilihan_perjalanan_controller.dart';

class PilihanPerjalananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihanPerjalananController>(
      () => PilihanPerjalananController(),
    );
  }
}
