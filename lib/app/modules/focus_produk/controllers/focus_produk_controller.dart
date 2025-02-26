import 'package:get/get.dart';

class FocusProdukController extends GetxController {
  var selectedPacket = ''.obs;
  var selectedRoom = ''.obs;
  var namaPaket = ["SILVER", "GOLD", "PREMIUM"];
  var namaKamar = ["QUAD", "DOUBLE", "TRIPLE"];

  void toggleSelection(String value) {
    if (selectedPacket.value == value) {
      selectedPacket.value = '';
    } else {
      selectedPacket.value = value;
    }
    update();
  }
}
