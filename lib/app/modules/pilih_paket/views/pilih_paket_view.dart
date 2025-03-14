import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/perjalanan_saya/views/perjalanan_saya_view.dart';

import '../controllers/pilih_paket_controller.dart';

class PilihPaketView extends GetView<PilihPaketController> {
  const PilihPaketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        actions: [
          IconButton(
            onPressed: () {
              AllMaterial.messageScaffold(
                  title: "Fitur sedang digarap, coba lagi nanti!");
            },
            icon: const Icon(Icons.filter_alt_rounded),
          ),
        ],
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: TextField(
            selectionControls: MaterialTextSelectionControls(),
            // controller: loginController.userC,
            // focusNode: loginController.userF,
            cursorColor: AllMaterial.colorBlack,
            textInputAction: TextInputAction.done,
            onTapOutside: (_) {
              // loginController.userF.unfocus();
            },
            style: AllMaterial.inter(
              color: AllMaterial.colorGreyPrim,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              hintText: "Telusuri Paket Umroh/Haji...",
              hintStyle: AllMaterial.inter(
                color: AllMaterial.colorGreyPrim,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              hoverColor: AllMaterial.colorStroke,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusColor: AllMaterial.colorStroke,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AllMaterial.colorPrimary,
                  ),
                  onPressed: () {
                    AllMaterial.messageScaffold(
                        title: "Fitur sedang digarap, coba lagi nanti!");
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AllMaterial.colorWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 22, left: 22, top: 20),
          child: ListView(
            children: [
              Wrap(
                spacing: Get.width / 20,
                runAlignment: WrapAlignment.spaceAround,
                runSpacing: 18,
                children: [
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                  AllMaterial.productItem(
                    img: "assets/images/login.jpg",
                    hargaPaket: "25.000.000",
                    jenisPaket: "Haji & Umroh",
                    namaPaket: "Umroh Summer Regular",
                    onTap: () {
                      Get.to(() => const PerjalananSayaView(), arguments: {
                        "isPerjalananSaya": false,
                      });
                    },
                    rating: "4.2",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
