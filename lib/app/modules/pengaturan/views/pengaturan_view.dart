import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/chat_list/views/chat_list_view.dart';
import 'package:gvinum_travel/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:gvinum_travel/app/modules/jadwal_manasik/views/jadwal_manasik_view.dart';
import 'package:gvinum_travel/app/modules/login_page/views/login_page_view.dart';
import 'package:gvinum_travel/app/modules/pilihan_perjalanan/views/pilihan_perjalanan_view.dart';

import '../controllers/pengaturan_controller.dart';

class PengaturanView extends GetView<PengaturanController> {
  const PengaturanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Pengaturan & Lainnya',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 16,
          ),
          child: ListView(
            children: [
              AllMaterial.settingWidget(
                title: "Edit Profil",
                onTap: () {
                  Get.to(() => const EditProfilView());
                },
                svg: "assets/icon/edit.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "Ubah Password",
                onTap: () {
                  AllMaterial.messageScaffold(
                      title: "Fitur sedang digarap, coba lagi nanti!");
                },
                svg: "assets/icon/password.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "Perjalanan Saya",
                onTap: () {
                  Get.to(() => const PilihanPerjalananView(), arguments: {
                    "isPerjalananSaya": true,
                  });
                },
                svg: "assets/icon/perjalanan.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "List Rombongan",
                onTap: () {
                  Get.to(() => const PilihanPerjalananView(), arguments: {
                    "isPerjalananSaya": false,
                  });
                },
                svg: "assets/icon/rombongan.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "Jadwal Manasik",
                onTap: () {
                  Get.to(() => const JadwalManasikView());
                },
                svg: "assets/icon/manasik.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "Verifikasi Email",
                onTap: () {
                  AllMaterial.messageScaffold(
                      title: "Fitur sedang digarap, coba lagi nanti!");
                },
                svg: "assets/icon/email.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "Hubungi Admin",
                onTap: () {
                  Get.to(() => const ChatListView());
                },
                svg: "assets/icon/chat.svg",
              ),
              const SizedBox(height: 16),
              AllMaterial.settingWidget(
                title: "Logout",
                onTap: () {
                  Get.to(() => const LoginPageView());
                },
                svg: "assets/icon/logout.svg",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
