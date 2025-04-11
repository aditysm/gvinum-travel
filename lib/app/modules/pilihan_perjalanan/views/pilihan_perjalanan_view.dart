// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/modules/list_rombongan/views/list_rombongan_view.dart';
import 'package:gvinum_travel/app/modules/perjalanan_saya/views/perjalanan_saya_view.dart';
import 'package:intl/intl.dart';

import '../controllers/pilihan_perjalanan_controller.dart';

class PilihanPerjalananView extends GetView<PilihanPerjalananController> {
  const PilihanPerjalananView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PilihanPerjalananController());
    bool isPerjalananSaya = Get.arguments["isPerjalananSaya"] ?? false;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Histori Pemesanan',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: (controller.diprosesList.isEmpty &&
              controller.dibatalkanList.isEmpty &&
              controller.dikonfirmasiList.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    "Belum ada list perjalanan",
                    style: AllMaterial.inter(),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Expanded 1
                    (controller.dikonfirmasiList.isEmpty)
                        ? const SizedBox.shrink()
                        : Container(
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      "Dikonfirmasi",
                                      style: AllMaterial.inter(
                                        fontWeight: AllMaterial.fontMedium,
                                        color: AllMaterial.colorGreyPrim,
                                      ),
                                    ),
                                  ),
                                  ...List.generate(
                                      controller.dikonfirmasiList.length,
                                      (dikonfirmasiIndex) {
                                    return ListTile(
                                      onTap: () {
                                        if (isPerjalananSaya) {
                                          Get.to(
                                              () => const PerjalananSayaView(),
                                              arguments: {
                                                "idBooking": controller
                                                        .dikonfirmasiList[
                                                            dikonfirmasiIndex]
                                                        .id ??
                                                    0,
                                                "statusPackage": "Dikonfirmasi",
                                              });
                                        } else {
                                          Get.to(
                                              () => const ListRombonganView(),
                                              arguments: {
                                                "namePackage": controller
                                                    .perjalanan
                                                    .value
                                                    ?.data?[dikonfirmasiIndex]
                                                    .package
                                                    ?.name,
                                                "departurePackage": controller
                                                    .perjalanan
                                                    .value
                                                    ?.data?[dikonfirmasiIndex]
                                                    .package
                                                    ?.departureDate,
                                                "idBooking": controller
                                                        .perjalanan
                                                        .value
                                                        ?.data?[
                                                            dikonfirmasiIndex]
                                                        .id ??
                                                    0
                                              });
                                        }
                                      },
                                      contentPadding: EdgeInsets.zero,
                                      trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                      leading: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Image.network(
                                          controller
                                                  .perjalanan
                                                  .value
                                                  ?.data?[dikonfirmasiIndex]
                                                  .package
                                                  ?.image
                                                  ?.replaceAll(
                                                "localhost",
                                                ApiUrl.baseUrl,
                                              ) ??
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return SvgPicture.asset(
                                              "assets/icon/kaaba.svg",
                                              color: AllMaterial.colorGreyPrim,
                                            );
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icon/dibayar.svg"),
                                          const SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              controller
                                                      .perjalanan
                                                      .value
                                                      ?.data?[dikonfirmasiIndex]
                                                      .package
                                                      ?.name ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              style: AllMaterial.inter(
                                                fontWeight:
                                                    AllMaterial.fontSemiBold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        "Dipesan pada: ${DateFormat('dd-MM-yyyy', 'id_ID').format(controller.dikonfirmasiList[dikonfirmasiIndex].bookingDate ?? DateTime.now())}",
                                        style: AllMaterial.inter(
                                          color: AllMaterial.colorGreyPrim,
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),

                    // Expanded 2
                    (controller.diprosesList.isEmpty)
                        ? const SizedBox.shrink()
                        : Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Di-booking",
                                    style: AllMaterial.inter(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorGreyPrim,
                                    ),
                                  ),
                                ),
                                ...List.generate(controller.diprosesList.length,
                                    (diprosesIndex) {
                                  return ListTile(
                                    onTap: () {
                                      if (isPerjalananSaya) {
                                        Get.to(() => const PerjalananSayaView(),
                                            arguments: {
                                              "idBooking": controller
                                                      .diprosesList[
                                                          diprosesIndex]
                                                      .id ??
                                                  0,
                                              "statusPackage": "Diproses"
                                            });
                                      } else {
                                        Get.to(() => const ListRombonganView(),
                                            arguments: {
                                              "namePackage": controller
                                                  .perjalanan
                                                  .value
                                                  ?.data?[diprosesIndex]
                                                  .package
                                                  ?.name,
                                              "departurePackage": controller
                                                  .perjalanan
                                                  .value
                                                  ?.data?[diprosesIndex]
                                                  .package
                                                  ?.departureDate,
                                              "idBooking": controller
                                                      .perjalanan
                                                      .value
                                                      ?.data?[diprosesIndex]
                                                      .id ??
                                                  0
                                            });
                                      }
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                    leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.network(
                                        controller
                                                .perjalanan
                                                .value
                                                ?.data?[diprosesIndex]
                                                .package
                                                ?.image
                                                ?.replaceAll(
                                              "localhost",
                                              ApiUrl.baseUrl,
                                            ) ??
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s",
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return SvgPicture.asset(
                                            "assets/icon/kaaba.svg",
                                            color: AllMaterial.colorGreyPrim,
                                          );
                                        },
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icon/pending.svg"),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            controller
                                                    .perjalanan
                                                    .value
                                                    ?.data?[diprosesIndex]
                                                    .package
                                                    ?.name ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: AllMaterial.inter(
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      "Dipesan pada: ${DateFormat('dd-MM-yyyy', 'id_ID').format(controller.diprosesList[diprosesIndex].bookingDate ?? DateTime.now())}",
                                      style: AllMaterial.inter(
                                        color: AllMaterial.colorGreyPrim,
                                      ),
                                    ),
                                  );
                                }),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),

                    // Expanded 3
                    (controller.dibatalkanList.isEmpty)
                        ? const SizedBox.shrink()
                        : Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "Dibatalkan",
                                    style: AllMaterial.inter(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorGreyPrim,
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                    controller.dibatalkanList.length,
                                    (dibatalkanIndex) {
                                  return ListTile(
                                    onTap: () {
                                      if (isPerjalananSaya) {
                                        Get.to(() => const PerjalananSayaView(),
                                            arguments: {
                                              "idBooking": controller
                                                      .dibatalkanList[
                                                          dibatalkanIndex]
                                                      .id ??
                                                  0,
                                              "statusPackage": "Dibatalkan",
                                            });
                                      } else {
                                        Get.to(
                                          () => const ListRombonganView(),
                                          arguments: {
                                            "namePackage": controller
                                                .perjalanan
                                                .value
                                                ?.data?[dibatalkanIndex]
                                                .package
                                                ?.name,
                                            "departurePackage": controller
                                                .perjalanan
                                                .value
                                                ?.data?[dibatalkanIndex]
                                                .package
                                                ?.departureDate,
                                            "idBooking": controller
                                                    .perjalanan
                                                    .value
                                                    ?.data?[dibatalkanIndex]
                                                    .id ??
                                                0
                                          },
                                        );
                                      }
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    trailing: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                    leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.network(
                                        controller
                                                .perjalanan
                                                .value
                                                ?.data?[dibatalkanIndex]
                                                .package
                                                ?.image
                                                ?.replaceAll(
                                              "localhost",
                                              ApiUrl.baseUrl,
                                            ) ??
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s",
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return SvgPicture.asset(
                                            "assets/icon/kaaba.svg",
                                            color: AllMaterial.colorGreyPrim,
                                          );
                                        },
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icon/dibatalkan.svg"),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            controller
                                                    .perjalanan
                                                    .value
                                                    ?.data?[dibatalkanIndex]
                                                    .package
                                                    ?.name ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: AllMaterial.inter(
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      "Dipesan pada: ${DateFormat('dd-MM-yyyy', 'id_ID').format(controller.dibatalkanList[dibatalkanIndex].bookingDate ?? DateTime.now())}",
                                      style: AllMaterial.inter(
                                        color: AllMaterial.colorGreyPrim,
                                      ),
                                    ),
                                  );
                                }),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
