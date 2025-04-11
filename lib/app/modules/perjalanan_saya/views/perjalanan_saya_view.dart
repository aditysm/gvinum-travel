// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:intl/intl.dart';

import '../controllers/perjalanan_saya_controller.dart';

class PerjalananSayaView extends GetView<PerjalananSayaController> {
  const PerjalananSayaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PerjalananSayaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Obx(
          () => Text(
            "Paket ${controller.status.value}",
            style: AllMaterial.inter(
              color: AllMaterial.colorBlack,
              fontWeight: AllMaterial.fontBold,
              fontSize: 17,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      (controller.package.value?.data?.package?.image ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                          .replaceAll("localhost", ApiUrl.baseUrl),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.network(
                  (controller.package.value?.data?.package?.image ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                      .replaceAll("localhost", ApiUrl.baseUrl),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: SvgPicture.asset(
                        "assets/icon/kaaba.svg",
                        color: AllMaterial.colorGreyPrim,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            // maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding: const EdgeInsets.only(top: 24, left: 24, bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.04),
                        blurRadius: 20,
                        offset: const Offset(-12, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Obx(
                          () => Text(
                            controller.package.value?.data?.package?.name ?? "",
                            style: AllMaterial.inter(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorBlack,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.only(
                                right: 5,
                                top: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AllMaterial.colorPrimary,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AllMaterial.colorStroke,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icon/package.svg",
                                      ),
                                      const SizedBox(width: 4),
                                      Obx(
                                        () => Text(
                                          controller.package.value?.data
                                                  ?.packagePrice?.packageType ??
                                              "",
                                          style: AllMaterial.inter(
                                            color: AllMaterial.colorWhite,
                                            fontWeight: AllMaterial.fontMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.only(
                                right: 5,
                                top: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AllMaterial.colorPrimary,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AllMaterial.colorStroke,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/icon/room.svg"),
                                      const SizedBox(width: 4),
                                      Obx(
                                        () => Text(
                                          controller.package.value?.data
                                                  ?.packagePrice?.roomType ??
                                              "",
                                          style: AllMaterial.inter(
                                            color: AllMaterial.colorWhite,
                                            fontWeight: AllMaterial.fontMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.only(
                                right: 5,
                                top: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AllMaterial.colorWhitePrimary,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AllMaterial.colorStroke,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/icon/seats.svg"),
                                      const SizedBox(width: 4),
                                      Obx(
                                        () => Text(
                                          "${controller.package.value?.data?.packagePrice?.seatCount ?? 0} Seats",
                                          style: AllMaterial.inter(
                                            color: AllMaterial.colorPrimary,
                                            fontWeight: AllMaterial.fontMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Obx(
                          () => RichText(
                            text: TextSpan(
                              text: "Jadwal Keberangkatan : ",
                              style: AllMaterial.inter(
                                fontWeight: AllMaterial.fontMedium,
                                color: AllMaterial.colorGreyPrim,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: controller.package.value?.data?.package
                                              ?.departureDate ==
                                          null
                                      ? "-"
                                      : AllMaterial.hariTanggalBulanTahun(
                                          controller.package.value?.data
                                                  ?.package?.departureDate
                                                  ?.toIso8601String() ??
                                              ""),
                                  style: AllMaterial.inter(
                                    fontWeight: AllMaterial.fontMedium,
                                    color: AllMaterial.colorSoftPrimary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllMaterial.titleMenu(
                              title: "Deskripsi Paket",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 15),
                            Obx(
                              () => Text(
                                controller
                                        .package.value?.data?.package?.detail ??
                                    "Tidak ada deskripsi paket",
                                style: AllMaterial.inter(
                                  color: AllMaterial.colorGreyPrim,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const SizedBox(height: 15),
                            AllMaterial.titleMenu(
                              title: "Rating Pengguna",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${controller.rating.value?.data?.statistik?.avgRating ?? 0.0}",
                                            style: AllMaterial.inter(
                                              color: AllMaterial.colorBlack,
                                              fontSize: 30,
                                              fontWeight: AllMaterial.fontBold,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: AllMaterial.colorYellow,
                                            size: 35,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${controller.rating.value?.data?.reviews?.length ?? 0} Reviews",
                                        style: AllMaterial.inter(
                                          color: AllMaterial.colorGreyPrim,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1.5,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: AllMaterial.colorGreySec,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      5,
                                      (index) {
                                        var integ = [5, 4, 3, 2, 1];
                                        return Obx(
                                          () {
                                            int? statistik = 0;
                                            if (index == 0) {
                                              statistik = controller
                                                  .rating
                                                  .value
                                                  ?.data
                                                  ?.statistik
                                                  ?.count5;
                                            } else if (index == 1) {
                                              statistik = controller
                                                  .rating
                                                  .value
                                                  ?.data
                                                  ?.statistik
                                                  ?.count4;
                                            } else if (index == 2) {
                                              statistik = controller
                                                  .rating
                                                  .value
                                                  ?.data
                                                  ?.statistik
                                                  ?.count3;
                                            } else if (index == 3) {
                                              statistik = controller
                                                  .rating
                                                  .value
                                                  ?.data
                                                  ?.statistik
                                                  ?.count2;
                                            } else if (index == 4) {
                                              statistik = controller
                                                  .rating
                                                  .value
                                                  ?.data
                                                  ?.statistik
                                                  ?.count1;
                                            } else {
                                              statistik = 0;
                                            }
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${integ[index]}",
                                                  style: AllMaterial.inter(
                                                    color: AllMaterial
                                                        .colorGreyPrim,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Icon(
                                                  Icons.star,
                                                  color:
                                                      AllMaterial.colorYellow,
                                                ),
                                                const SizedBox(width: 5),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 2,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: AllMaterial
                                                            .colorGreySec,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 2,
                                                      width: statistik != null
                                                          ? statistik > 100
                                                              ? 100
                                                              : statistik
                                                                  .toDouble()
                                                          : 0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        color: AllMaterial
                                                            .colorSoftPrimary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "$statistik",
                                                  style: AllMaterial.inter(
                                                    color: AllMaterial
                                                        .colorGreyPrim,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Obx(
                                  () {
                                    var list = controller.rating.value?.data
                                            ?.reviews?.length ??
                                        0;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        list > 3 ? 3 : list,
                                        (index) {
                                          if (list == 0) {
                                            return Column(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Tidak ada review dari mu'tamir lain",
                                                    style: AllMaterial.inter(
                                                      color: AllMaterial
                                                          .colorBlack,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 50),
                                              ],
                                            );
                                          }
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: AllMaterial
                                                            .colorYellow,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        "${controller.rating.value?.data?.reviews?[index].rating ?? ""}",
                                                        style:
                                                            AllMaterial.inter(
                                                          color: AllMaterial
                                                              .colorGreyPrim,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(
                                                      DateTime.parse(
                                                        controller
                                                                .rating
                                                                .value
                                                                ?.data
                                                                ?.reviews?[
                                                                    index]
                                                                .createdAt
                                                                .toString() ??
                                                            DateTime.now()
                                                                .toIso8601String(),
                                                      ),
                                                    ),
                                                    style: AllMaterial.inter(
                                                      color: AllMaterial
                                                          .colorGreyPrim,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Obx(
                                                () => Text(
                                                  controller
                                                          .rating
                                                          .value
                                                          ?.data
                                                          ?.reviews?[index]
                                                          .user
                                                          ?.name ??
                                                      "",
                                                  style: AllMaterial.inter(
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                    color:
                                                        AllMaterial.colorBlack,
                                                  ),
                                                ),
                                              ),
                                              Obx(
                                                () => Text(
                                                  controller
                                                          .rating
                                                          .value
                                                          ?.data
                                                          ?.reviews?[index]
                                                          .review ??
                                                      "",
                                                  style: AllMaterial.inter(),
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: controller.status.value == "Diproses"
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: AllMaterial.cusButton(
                addIcon: true,
                icon: const Icon(
                  Icons.clear,
                  color: AllMaterial.colorWhite,
                ),
                label: "Batalkan Paket",
                onTap: () {},
              ),
            )
          : null,
    );
  }
}
