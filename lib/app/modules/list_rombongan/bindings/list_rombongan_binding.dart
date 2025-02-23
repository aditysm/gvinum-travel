import 'package:get/get.dart';

import '../controllers/list_rombongan_controller.dart';

class ListRombonganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListRombonganController>(
      () => ListRombonganController(),
    );
  }
}
