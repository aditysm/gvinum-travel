import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/perjalanan_saya/views/perjalanan_saya_view.dart';
import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotifikasiController());

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
          child: Obx(() {
            var allNotif =
                (controller.allNotifikasi.value?.data?.entries.toList() ?? [])
                  ..sort((a, b) => b.key.compareTo(a.key));

            if (allNotif.isEmpty) {
              return const Center(
                child: Text("Belum ada notifikasi..."),
              );
            }

            return ListView.builder(
              itemCount: allNotif.length,
              itemBuilder: (context, index) {
                final entry = allNotif[index];
                final tanggal = entry.key;
                final listNotif = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AllMaterial.hariTanggalBulanTahun(tanggal),
                      style: AllMaterial.inter(
                        fontWeight: AllMaterial.fontMedium,
                        color: AllMaterial.colorGreyPrim,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...listNotif.map((notif) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: AllMaterial.notifWidget(
                          atas: notif.title,
                          dibaca: notif.reads?.isNotEmpty ?? false,
                          bawah: notif.body,
                          onTap: () {
                            controller.postReadChat(notif.id);
                            AllMaterial.detilKonten(
                              title: notif.title,
                              subtitle: notif.body,
                              tanggal: notif.createdAt?.toIso8601String(),
                              buttonLabel: "Cek Perjalanan Saya",
                              onTap: () {
                                Get.back();
                                Get.to(() => const PerjalananSayaView());
                              },
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
