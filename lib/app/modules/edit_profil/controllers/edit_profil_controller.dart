import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/modules/home_page/controllers/home_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilController extends GetxController {
  final homeCont = Get.find<HomeController>();
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  var namaChanged = false.obs;
  var fotoProfileChanged = false.obs;
  var nama = "".obs;
  final ImagePicker _picker = ImagePicker();
  var imagePath = RxString("");
  var pp = "".obs;
  FocusNode namaF = FocusNode();
  FocusNode emailF = FocusNode();
  var token = AllMaterial.box.read("token");
  RxString pickedImage = RxString("");

  Future<void> requestPermissions() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted && storageStatus.isGranted) {
      chooseImageSource();
    } else {
      Get.snackbar(
        'Izin Diperlukan',
        'Aplikasi membutuhkan izin kamera dan penyimpanan.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> chooseImageSource() async {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          'Pilih Sumber Gambar',
          style: AllMaterial.inter(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
                pickImage(ImageSource.camera);
              },
              child: Text(
                'Kamera',
                style: AllMaterial.inter(color: AllMaterial.colorGreyPrim),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                pickImage(ImageSource.gallery);
              },
              child: Text(
                'Galeri',
                style: AllMaterial.inter(color: AllMaterial.colorGreyPrim),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      pickedImage.value = image.path;
      fotoProfileChanged.value = true;
      update();
    }
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<void> putEditProfile() async {
    try {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            backgroundColor: AllMaterial.colorPrimary,
            color: AllMaterial.colorSoftPrimary,
          ),
        ),
        barrierDismissible: false,
      );

      String fotoProfile = pickedImage.value != ""
          ? await imageToBase64(File(pickedImage.value))
          : homeCont.user.value?.data?.fotoProfile ?? "";

      final uri = Uri.parse(ApiUrl.urlPutProfileUser);
      final request = http.MultipartRequest('PUT', uri);

      // Header
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
      });

      request.fields['name'] = namaC.text;
      if (pickedImage.value.isNotEmpty) {
        request.fields['foto_profile'] = fotoProfile;
      }

      if (pickedImage.value.isNotEmpty) {
        final fileStream = await http.MultipartFile.fromPath(
          'foto_profile',
          pickedImage.value,
        );
        request.files.add(fileStream);
      }

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);
      var data = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        homeCont.fetchDataUser();
        AllMaterial.messageScaffold(title: "Profil berhasil diedit!");
        namaChanged.value = false;
        fotoProfileChanged.value = false;

        print(data);
      } else {
        print(data);
        AllMaterial.messageScaffold(
          title: "Terjadi kesalahan: ${data["msg"]}",
        );
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      AllMaterial.messageScaffold(
          title: "Terjadi kesalahan saat mengedit profil.");
    } finally {
      if (Get.isDialogOpen == true) Get.back();
    }
  }

  @override
  void onInit() {
    nama.value = homeCont.user.value?.data?.name ?? "";
    namaC.text = homeCont.user.value?.data?.name ?? "";
    emailC.text = homeCont.user.value?.data?.email ?? "";

    namaC.addListener(() {
      namaChanged.value = namaC.text != nama.value;
    });

    super.onInit();
  }
}
