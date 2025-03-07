import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/perjalanan_saya/views/perjalanan_saya_view.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Notifikasi Saya',
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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: ListView(
            children: [
              AllMaterial.notifWidget(
                atas: "Perjalanan Anda Berhasil!",
                dibaca: false,
                onTap: () {
                  AllMaterial.detilKonten(
                    title: "Perjalanan Anda Berhasil!",
                    subtitle:
                        "Paket Umrah Winter Regular berhasil dilakukan, silahkan berikan rating untuk paket yang telah digunakan!",
                    buttonLabel: "Cek Perjalanan Saya",
                    onTap: () {
                      Get.back();
                      Get.to(() => const PerjalananSayaView());
                    },
                  );
                },
                bawah:
                    "Paket Umrah Winter Regular berhasil dilakukan, silahkan berikan rating untuk paket yang telah digunakan!",
              ),
              const SizedBox(height: 16),
              AllMaterial.notifWidget(
                atas: "Pembelian Paket Berhasil!",
                dibaca: false,
                onTap: () {
                  AllMaterial.detilKonten(
                    title: "Pembelian Paket Berhasil!",
                    subtitle:
                        "Paket Umrah Winter Regular seharga Rp. 25.000 berhasil dibeli, silahkan periksa perjalanan Anda untuk informasi lebih lanjut.",
                    buttonLabel: "Beri Rating",
                    onTap: () {
                      Get.back();
                      AllMaterial.messageScaffold(
                          title: "Fitur sedang digarap, coba lagi nanti!");
                    },
                  );
                },
                bawah:
                    "Paket Umrah Winter Regular seharga Rp. 25.000 berhasil dibeli, silahkan periksa perjalanan Anda untuk informasi lebih lanjut.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
