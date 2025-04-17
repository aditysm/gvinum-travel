import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/focus_produk/views/focus_produk_view.dart';
import 'package:intl/intl.dart';

import '../controllers/pilih_paket_controller.dart';

class PilihPaketView extends GetView<PilihPaketController> {
  const PilihPaketView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PilihPaketController());
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
          child: Obx(
            () {
              var paket = controller.package.value?.data?.length ?? 0;
              if (paket > 0) {
                print(paket);
                return ListView(
                  children: [
                    Wrap(
                      // spacing: Get.width / 20,
                      runAlignment: WrapAlignment.spaceAround,
                      runSpacing: 18,
                      alignment: WrapAlignment.center,
                      children: List.generate(paket, (index) {
                        var data = controller.package.value?.data?[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: AllMaterial.productItem(
                            hargaPaket: (data?.package?.packagePrices != null &&
                                    data!.package!.packagePrices!.isNotEmpty)
                                ? 'Rp${NumberFormat('#,###', 'id_ID').format(data.package!.packagePrices![0].price)}'
                                : 'Harga tidak tersedia',
                            img: "${data?.package?.image}",
                            jenisPaket: "${data?.package?.category}",
                            namaPaket: "${data?.package?.name}",
                            onTap: () {
                              Get.to(() => const FocusProdukView(), arguments: {
                                "idPackage": data?.package?.id ?? 0
                              });
                            },
                            rating: "${data?.avgRating ?? "0.0"}",
                          ),
                        );
                      }),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
