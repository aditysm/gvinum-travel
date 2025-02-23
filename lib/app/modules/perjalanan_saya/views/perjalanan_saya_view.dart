import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';

import '../controllers/perjalanan_saya_controller.dart';

class PerjalananSayaView extends GetView<PerjalananSayaController> {
  const PerjalananSayaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Perjalanan Saya',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 15,
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/img.png',
                  ),
                  fit: BoxFit.cover,
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
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          "Umrah Winter Regular",
                          style: AllMaterial.inter(
                            fontWeight: AllMaterial.fontSemiBold,
                            color: AllMaterial.colorBlack,
                            fontSize: 25,
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
                                      Text(
                                        "Silver",
                                        style: AllMaterial.inter(
                                          color: AllMaterial.colorWhite,
                                          fontWeight: AllMaterial.fontMedium,
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
                                      Text(
                                        "Triple",
                                        style: AllMaterial.inter(
                                          color: AllMaterial.colorWhite,
                                          fontWeight: AllMaterial.fontMedium,
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
                                      Text(
                                        "32 Seats",
                                        style: AllMaterial.inter(
                                          color: AllMaterial.colorPrimary,
                                          fontWeight: AllMaterial.fontMedium,
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
                        child: RichText(
                          text: TextSpan(
                            text: "Jadwal Keberangkatan : ",
                            style: AllMaterial.inter(
                              fontWeight: AllMaterial.fontMedium,
                              color: AllMaterial.colorGreyPrim,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "3 Februari 2025",
                                style: AllMaterial.inter(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorSoftPrimary,
                                  fontSize: 14,
                                ),
                              )
                            ],
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
                            Text(
                              "Program 9 Hari\nQatar Airways\nTiket Pesawat PP Jakarta - Doha - Jeddah\nTour Mekkah - Madinah - Doha Qatar\nKereta Cepat Haramain",
                              style: AllMaterial.inter(
                                color: AllMaterial.colorGreyPrim,
                              ),
                            ),
                            const SizedBox(height: 15),
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
                                children: [
                                  Container(
                                    height: 100,
                                    width: 115,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AllMaterial.colorStroke,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/login.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 115,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AllMaterial.colorStroke,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/login.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 115,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AllMaterial.colorStroke,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/login.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 115,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AllMaterial.colorStroke,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/login.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                            "4.4",
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
                                        "923 Ratings",
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
                                    children: List.generate(5, (index) {
                                      var integ = [5, 4, 3, 2, 1];
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${integ[index]}",
                                            style: AllMaterial.inter(
                                              color: AllMaterial.colorGreyPrim,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(
                                            Icons.star,
                                            color: AllMaterial.colorYellow,
                                          ),
                                          const SizedBox(width: 5),
                                          Stack(
                                            children: [
                                              Container(
                                                height: 2,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color:
                                                      AllMaterial.colorGreySec,
                                                ),
                                              ),
                                              Container(
                                                height: 2,
                                                width:
                                                    integ[index] + 1 * 20 + 15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: AllMaterial
                                                      .colorSoftPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "${integ[index]}0",
                                            style: AllMaterial.inter(
                                              color: AllMaterial.colorGreyPrim,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  3,
                                  (index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color:
                                                      AllMaterial.colorYellow,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "4",
                                                  style: AllMaterial.inter(
                                                    color: AllMaterial
                                                        .colorGreyPrim,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "05-10-2025",
                                              style: AllMaterial.inter(
                                                color:
                                                    AllMaterial.colorGreyPrim,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "Erric Hoffman",
                                          style: AllMaterial.inter(
                                            fontWeight:
                                                AllMaterial.fontSemiBold,
                                            color: AllMaterial.colorBlack,
                                          ),
                                        ),
                                        Text(
                                          "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi., Nunc risus massa, gravida id egestas ",
                                          style: AllMaterial.inter(),
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            AllMaterial.titleMenu(
                              title: "Paket Lain",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 15),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  AllMaterial.productItem(
                                    hargaPaket: "21.000.000",
                                    img: "assets/images/login.jpg",
                                    jenisPaket: "Umrah",
                                    namaPaket: "Umrah Winter Regular",
                                    onTap: () {},
                                    rating: "4.1",
                                  ),
                                  const SizedBox(width: 10),
                                  AllMaterial.productItem(
                                    hargaPaket: "21.000.000",
                                    img: "assets/images/login.jpg",
                                    jenisPaket: "Umrah",
                                    namaPaket: "Umrah Winter Regular",
                                    onTap: () {},
                                    rating: "4.4",
                                  ),
                                  const SizedBox(width: 10),
                                  AllMaterial.productItem(
                                    hargaPaket: "21.000.000",
                                    img: "assets/images/login.jpg",
                                    jenisPaket: "Umrah",
                                    namaPaket: "Umrah Winter Regular",
                                    onTap: () {},
                                    rating: "4.5",
                                  ),
                                  const SizedBox(width: 10),
                                ],
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
    );
  }
}
