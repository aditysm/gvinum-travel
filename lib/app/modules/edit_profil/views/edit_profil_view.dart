import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfilController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Edit Profil',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => controller.chooseImageSource(),
                      child: Obx(
                        () => Container(
                          alignment: Alignment.bottomRight,
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: AllMaterial.colorSoftPrimary,
                            boxShadow: [AllMaterial.topShadow],
                            borderRadius: BorderRadius.circular(1000),
                            image: controller.pickedImage.value.isEmpty
                                ? (controller.homeCont.user.value?.data
                                                ?.fotoProfile ==
                                            null ||
                                        controller.homeCont.user.value?.data
                                                ?.fotoProfile ==
                                            ""
                                    ? null
                                    : DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          controller.homeCont.user.value?.data
                                                  ?.fotoProfile
                                                  ?.replaceAll("localhost",
                                                      ApiUrl.baseUrl) ??
                                              "",
                                        ),
                                      ))
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                        File(controller.pickedImage.value)),
                                  ),
                          ),
                          child: IconButton(
                            color: AllMaterial.colorPrimary,
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AllMaterial.colorPrimary,
                              ),
                            ),
                            onPressed: () => controller.chooseImageSource(),
                            icon: const Icon(
                              Icons.edit,
                              color: AllMaterial.colorWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        AllMaterial.editableWidget(
                          controller: controller.namaC,
                          focusNode: controller.namaF,
                          label: "Nama",
                        ),
                        AllMaterial.editableWidget(
                          readOnly: true,
                          controller: controller.emailC,
                          focusNode: controller.emailF,
                          label: "Email",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => AllMaterial.cusButton(
            addIcon: false,
            label: "Simpan Perubahan",
            onTap: controller.namaChanged.value ||
                    controller.fotoProfileChanged.value
                ? () {
                    AllMaterial.cusDialogValidasi(
                      title: "Menyimpan Perubahan",
                      subtitle: "Apakah Kamu yakin?",
                      onConfirm: () async {
                        controller.putEditProfile();
                        Get.back();
                      },
                      onCancel: () => Get.back(),
                    );
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
