// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:intl/intl.dart';

import '../controllers/focus_produk_controller.dart';

class FocusProdukView extends GetView<FocusProdukController> {
  const FocusProdukView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FocusProdukController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Obx(
          () => Text(
            controller.package.value?.data?.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
                      (controller.package.value?.data?.image ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                          .replaceAll("localhost", ApiUrl.baseUrl),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.network(
                  (controller.package.value?.data?.image ??
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
                            controller.package.value?.data?.name ?? "",
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
                                          controller.paketDipilih.value,
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
                                          controller.kamarDipilih.value,
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
                                          "${controller.jumlahBangku.value} Seats",
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
                                  text: controller.package.value?.data
                                              ?.departureDate ==
                                          null
                                      ? "-"
                                      : AllMaterial.hariTanggalBulanTahun(
                                          controller.package.value?.data
                                                  ?.departureDate
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
                                controller.package.value?.data?.detail ??
                                    "Tidak ada deskripsi paket",
                                style: AllMaterial.inter(
                                  color: AllMaterial.colorGreyPrim,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Obx(
                              () {
                                var gallery = controller
                                        .package.value?.data?.gallery?.length ??
                                    0;
                                if (gallery != 0) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AllMaterial.titleMenu(
                                        title: "Galeri Paket",
                                        fontSize: 14,
                                        height: 13,
                                        width: 3,
                                      ),
                                      const SizedBox(height: 15),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: List.generate(
                                            gallery,
                                            (index) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  height: 100,
                                                  width: 115,
                                                  margin: const EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: AllMaterial
                                                          .colorStroke,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        (controller
                                                                    .package
                                                                    .value
                                                                    ?.data
                                                                    ?.gallery?[
                                                                        index]
                                                                    .image ??
                                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                                                            .replaceAll(
                                                                "localhost",
                                                                ApiUrl.baseUrl),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Image.network(
                                                    (controller
                                                                .package
                                                                .value
                                                                ?.data
                                                                ?.gallery?[
                                                                    index]
                                                                .image ??
                                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                                                        .replaceAll("localhost",
                                                            ApiUrl.baseUrl),
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Center(
                                                        child: SvgPicture.asset(
                                                          "assets/icon/kaaba.svg",
                                                          color: AllMaterial
                                                              .colorGreyPrim,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
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
                                                      ?.count5 ??
                                                  0;
                                            } else if (index == 1) {
                                              statistik = controller
                                                      .rating
                                                      .value
                                                      ?.data
                                                      ?.statistik
                                                      ?.count4 ??
                                                  0;
                                            } else if (index == 2) {
                                              statistik = controller
                                                      .rating
                                                      .value
                                                      ?.data
                                                      ?.statistik
                                                      ?.count3 ??
                                                  0;
                                            } else if (index == 3) {
                                              statistik = controller
                                                      .rating
                                                      .value
                                                      ?.data
                                                      ?.statistik
                                                      ?.count2 ??
                                                  0;
                                            } else if (index == 4) {
                                              statistik = controller
                                                      .rating
                                                      .value
                                                      ?.data
                                                      ?.statistik
                                                      ?.count1 ??
                                                  0;
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
                                                      // ignore: unnecessary_null_comparison
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
                                                    color:
                                                        AllMaterial.colorBlack,
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
                                                      style: AllMaterial.inter(
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
                                                              ?.reviews?[index]
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
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
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
                              ),
                            ),
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: AllMaterial.cusButton(
          addIcon: true,
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AllMaterial.colorWhite,
          ),
          label: "Pesan Paket",
          onTap: () {
            AllMaterial.detilKonten(
              customDetil: true,
              customDetilWidget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 5,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                (controller.package.value?.data?.image ??
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                                    .replaceAll("localhost", ApiUrl.baseUrl),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.package.value?.data?.name ?? "",
                              style: AllMaterial.inter(
                                fontWeight: AllMaterial.fontSemiBold,
                              ),
                            ),
                            Obx(
                              () => Text(
                                "Seats Available: ${controller.jumlahBangku.value}",
                                style: AllMaterial.inter(
                                  color: AllMaterial.colorGreyPrim,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Jenis Paket",
                      style: AllMaterial.inter(
                        fontWeight: AllMaterial.fontMedium,
                        color: AllMaterial.colorGreyPrim,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Wrap(
                        spacing: 10.0,
                        children: controller.namaPaket.map((String paket) {
                          return ChoiceChip(
                            checkmarkColor: AllMaterial.colorWhite,
                            label: Text(
                              paket,
                              style: const TextStyle(
                                color: AllMaterial.colorWhite,
                              ),
                            ),
                            elevation: 0,
                            side: const BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            selected: controller.paketDipilih.value == paket,
                            onSelected: (bool selected) {
                              controller.paketDipilih.value = paket;
                              controller.fetchPackagePrice();
                            },
                            selectedColor: AllMaterial.colorPrimary,
                            backgroundColor: AllMaterial.colorSoftPrimary,
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Jenis Kamar",
                      style: AllMaterial.inter(
                        fontWeight: AllMaterial.fontMedium,
                        color: AllMaterial.colorGreyPrim,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Wrap(
                        spacing: 10.0,
                        children: controller.namaKamar.map((String kamar) {
                          return ChoiceChip(
                            checkmarkColor: AllMaterial.colorWhite,
                            label: Text(
                              kamar,
                              style: const TextStyle(
                                color: AllMaterial.colorWhite,
                              ),
                            ),
                            elevation: 0,
                            side: const BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            selected: controller.kamarDipilih.value == kamar,
                            onSelected: (bool selected) {
                              controller.kamarDipilih.value = kamar;
                              controller.fetchPackagePrice();
                            },
                            selectedColor: AllMaterial.colorPrimary,
                            backgroundColor: AllMaterial.colorSoftPrimary,
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Paket",
                          style: AllMaterial.inter(
                            fontSize: 16,
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorGreyPrim,
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.detilPaket.value,
                            style: AllMaterial.inter(
                              color: AllMaterial.colorGreyPrim,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jumlah",
                          style: AllMaterial.inter(
                            fontSize: 16,
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorGreyPrim,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.totalPaketDipilih.value > 1) {
                                    controller.totalPaketDipilih.value--;
                                    controller.kurangTotal(
                                        controller.totalPaketDipilih.value);
                                    print(controller.totalAkhir.value);
                                  } else {
                                    print("object");
                                  }
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AllMaterial.colorGreyPrim,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: AllMaterial.inter(
                                        color: AllMaterial.colorGreyPrim,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                    horizontal: BorderSide(
                                      color: AllMaterial.colorGreyPrim,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Text(
                                      "${controller.totalPaketDipilih.value}",
                                      style: const TextStyle(
                                        color: AllMaterial.colorGreyPrim,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.totalPaketDipilih.value++;
                                  controller.hitungTotal(
                                    controller.hargaPaket.value,
                                    controller.totalPaketDipilih.value,
                                  );
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AllMaterial.colorGreyPrim,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: AllMaterial.inter(
                                        color: AllMaterial.colorGreyPrim,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          "Total Harga",
                          style: AllMaterial.inter(
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                textAlign: TextAlign.start,
                                "Rp${NumberFormat('#,###', 'id_ID').format(controller.totalAkhir.value)}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AllMaterial.inter(
                                  fontSize: 20,
                                  color: AllMaterial.colorPrimary,
                                  fontWeight: AllMaterial.fontBold,
                                ),
                              ),
                            ),
                            Obx(
                              () => ElevatedButton.icon(
                                onPressed:
                                    controller.totalPaketDipilih.value == 1 &&
                                            controller.hargaPaket.value == 0 &&
                                            controller.totalAkhir.value == 0
                                        ? null
                                        : () {
                                            // if (controller.totalAkhir.value != 0) {
                                            AllMaterial.cusDialogValidasi(
                                              title: "Memesan Paket",
                                              subtitle: "Apakah Kamu yakin?",
                                              onConfirm: () async {
                                                await controller
                                                    .postBookingPackage();
                                                Get.back();
                                              },
                                              onCancel: () => Get.back(),
                                            );
                                          },
                                label: Text(
                                  "Bayar",
                                  style: AllMaterial.inter(
                                    color: AllMaterial.colorWhite,
                                    fontSize: 16,
                                    fontWeight: AllMaterial.fontSemiBold,
                                  ),
                                ),
                                icon: SvgPicture.asset(
                                  "assets/icon/chat.svg",
                                  width: 18,
                                  height: 18,
                                  color: AllMaterial.colorWhite,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AllMaterial.colorPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Obx(
                          () {
                            if (controller.msg.value != "") {
                              return Text(
                                controller.msg.value,
                                style: AllMaterial.inter(
                                  color: AllMaterial.colorPrimary,
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
