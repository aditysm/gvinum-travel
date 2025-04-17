import 'package:get/get.dart';

import '../controllers/focus_produk_controller.dart';

class FocusProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FocusProdukController>(
      () => FocusProdukController(),
    );
  }
}
