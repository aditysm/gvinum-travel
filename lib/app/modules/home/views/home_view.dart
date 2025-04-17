import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/controller/general_controller.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/modules/chat_list/views/chat_list_view.dart';
import 'package:gvinum_travel/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:gvinum_travel/app/modules/focus_produk/views/focus_produk_view.dart';
import 'package:gvinum_travel/app/modules/jadwal_manasik/views/jadwal_manasik_view.dart';
import 'package:gvinum_travel/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:gvinum_travel/app/modules/pengaturan/views/pengaturan_view.dart';
import 'package:gvinum_travel/app/modules/pilih_paket/views/pilih_paket_view.dart';
import 'package:gvinum_travel/app/modules/pilihan_perjalanan/views/pilihan_perjalanan_view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        title: Text(
          'Gvinum Travel',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Obx(
              () => controller.unreadCount.value == 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        size: 28,
                        color: AllMaterial.colorBlack,
                      ),
                      onPressed: () {
                        Get.to(() => const NotifikasiView());
                      },
                    )
                  : badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 0, end: 0),
                      showBadge: true,
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: AllMaterial.colorPrimary,
                        padding: EdgeInsets.all(6),
                        elevation: 0,
                      ),
                      badgeContent: Obx(
                        () => Text(
                          '${controller.unreadCount.value}',
                          style: AllMaterial.inter(
                            color: AllMaterial.colorWhitePrimary,
                            fontSize: 12,
                            fontWeight: AllMaterial.fontBold,
                          ),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          size: 28,
                          color: AllMaterial.colorBlack,
                        ),
                        onPressed: () {
                          Get.to(() => const NotifikasiView());
                        },
                      ),
                    ),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              'assets/icon/menu.svg',
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: AllMaterial.colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        surfaceTintColor: AllMaterial.colorWhite,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: context.mediaQueryPadding.top + 15,
          ),
          children: [
            Row(
              children: [
                Obx(
                  () => controller.user.value?.data?.fotoProfile == "" ||
                          controller.user.value?.data?.fotoProfile == null
                      ? Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: AllMaterial.colorSoftPrimary,
                          ),
                          child: Obx(
                            () => Text(
                              controller.user.value?.data?.name?[0]
                                      .toUpperCase() ??
                                  "P",
                              style: AllMaterial.inter(
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontSemiBold,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            // Get.to(
                            //   () => HeroImage(
                            //     imageUrl: mainCont
                            //             .profilWalas.value?.data?.fotoProfile
                            //             ?.replaceAll(
                            //                 "localhost", ApiUrl.baseUrl) ??
                            //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s",
                            //   ),
                            // );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: AllMaterial.colorSoftPrimary,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  controller.user.value?.data?.fotoProfile
                                          ?.replaceAll(
                                        "localhost",
                                        ApiUrl.baseUrl,
                                      ) ??
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s",
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              AllMaterial.formatNamaPanjang(
                                  controller.user.value?.data?.name ?? ""),
                              style: AllMaterial.inter(
                                fontWeight: AllMaterial.fontSemiBold,
                                color: AllMaterial.colorBlack,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(() => const EditProfilView());
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: AllMaterial.colorSoftPrimary,
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            AllMaterial.formatEmail(
                                controller.user.value?.data?.email ?? ""),
                            style: AllMaterial.inter(
                              fontWeight: AllMaterial.fontMedium,
                              color: AllMaterial.colorGreyPrim,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            AllMaterial.drawerItem(
              warnaBackground: AllMaterial.colorPrimary,
              warnaText: AllMaterial.colorWhite,
              warnaSvg: AllMaterial.colorWhite,
              svg: "assets/icon/perjalanan.svg",
              onTap: () {
                Get.back();
                Get.to(() => const PilihanPerjalananView(), arguments: {
                  "isPerjalananSaya": true,
                });
              },
              title: "Perjalanan Saya",
            ),
            const SizedBox(height: 10),
            AllMaterial.drawerItem(
              svg: "assets/icon/paket.svg",
              onTap: () {
                Get.back();
                Get.to(() => const PilihPaketView());
              },
              title: "Pilih Paket",
            ),
            const SizedBox(height: 10),
            AllMaterial.drawerItem(
              svg: "assets/icon/rombongan.svg",
              onTap: () {
                Get.back();
                Get.to(() => const PilihanPerjalananView(), arguments: {
                  "isPerjalananSaya": false,
                });
              },
              title: "List Rombongan",
            ),
            const SizedBox(height: 10),
            AllMaterial.drawerItem(
              svg: "assets/icon/manasik.svg",
              onTap: () {
                Get.back();
                Get.to(() => const JadwalManasikView());
              },
              title: "Jadwal Manasik",
            ),
            const SizedBox(height: 10),
            AllMaterial.drawerItem(
              svg: "assets/icon/pengaturan.svg",
              onTap: () {
                Get.back();
                Get.to(() => const PengaturanView());
              },
              title: "Pengaturan",
            ),
            const SizedBox(height: 10),
            AllMaterial.drawerItem(
              svg: "assets/icon/logout.svg",
              warnaSvg: AllMaterial.colorSoftPrimary,
              warnaText: AllMaterial.colorSoftPrimary,
              onTap: () {
                final genC = Get.put(GeneralController());
                AllMaterial.cusDialogValidasi(
                  title: "Logout",
                  subtitle: "Apakah Kamu yakin?",
                  onConfirm: () async {
                    await genC.logout();
                    Get.back();
                    Get.back();
                  },
                  onCancel: () => Get.back(),
                );
              },
              title: "Logout",
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: AllMaterial.colorGreySec),
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AllMaterial.colorGreyPrim,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Hubungi Admin",
                      style:
                          AllMaterial.inter(color: AllMaterial.colorGreyPrim),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.back();
                        Get.to(() => const ChatListView());
                      },
                      label: Text(
                        "Chat",
                        style: AllMaterial.inter(
                          color: AllMaterial.colorBlack,
                          fontSize: 16,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icon/chat.svg",
                        // ignore: deprecated_member_use
                        color: AllMaterial.colorBlack,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllMaterial.colorWhite,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: AllMaterial.colorStroke,
                          ),
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
                    ElevatedButton.icon(
                      onPressed: () {
                        AllMaterial.openWhatsApp(
                            phone: "6285738565172",
                            message:
                                "Assalamu’alaikum warahmatullahi wabarakatuh,\n\n"
                                "Saya ingin bertanya mengenai paket haji/umroh yang tersedia. Bisa dibantu dengan informasi terkait jadwal keberangkatan, fasilitas, serta biaya yang ditawarkan?\n\n"
                                "Terima kasih.\n\n"
                                "Wassalamu’alaikum warahmatullahi wabarakatuh.");
                      },
                      label: Text(
                        "Message",
                        style: AllMaterial.inter(
                          color: AllMaterial.colorWhite,
                          fontSize: 16,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icon/whatsapp.svg",
                        width: 18,
                        height: 18,
                        // ignore: deprecated_member_use
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
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ASSALAMUALAIKUM, mu'tamir!".toUpperCase(),
                    style: AllMaterial.inter(
                      color: AllMaterial.colorGreyPrim,
                      letterSpacing: 1.7,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sudah siap menjadi tamu Allah?",
                    style: AllMaterial.inter(
                      fontSize: 30,
                      fontWeight: AllMaterial.fontBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextField(
                      onTap: () {
                        print("object");
                        Get.to(() => const PilihPaketView());
                      },
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
                      readOnly: true,
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
                            color: AllMaterial.colorGreySec,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hoverColor: AllMaterial.colorStroke,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: AllMaterial.colorGreySec,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusColor: AllMaterial.colorStroke,
                        filled: true,
                        fillColor: AllMaterial.colorWhitePrimary,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: AllMaterial.colorGreySec,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
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
                              print("object");
                              Get.to(() => const PilihPaketView());
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => const PilihPaketView());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(250),
                                    color: AllMaterial.colorPrimary,
                                  ),
                                  child: SvgPicture.asset(
                                    fit: BoxFit.none,
                                    "assets/icon/paket.svg",
                                  ),
                                ),
                                const SizedBox(height: 13),
                                Text(
                                  "Paket",
                                  style: AllMaterial.inter(
                                    color: AllMaterial.colorGreyPrim,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const PilihanPerjalananView(),
                                  arguments: {
                                    "isPerjalananSaya": false,
                                  });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(250),
                                    color: AllMaterial.colorGreen,
                                  ),
                                  child: SvgPicture.asset(
                                    fit: BoxFit.none,
                                    "assets/icon/rombongan.svg",
                                  ),
                                ),
                                const SizedBox(height: 13),
                                Text(
                                  "Rombongan",
                                  style: AllMaterial.inter(
                                    color: AllMaterial.colorGreyPrim,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const JadwalManasikView());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(250),
                                    color: AllMaterial.colorBlue,
                                  ),
                                  child: SvgPicture.asset(
                                    fit: BoxFit.none,
                                    "assets/icon/manasik.svg",
                                  ),
                                ),
                                const SizedBox(height: 13),
                                Text(
                                  "Manasik",
                                  style: AllMaterial.inter(
                                    color: AllMaterial.colorGreyPrim,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const PengaturanView());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(250),
                                    color: AllMaterial.colorWhitePrimary,
                                    border: Border.all(
                                      color: AllMaterial.colorGreySec,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: AllMaterial.colorGreyPrim,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(height: 13),
                                Text(
                                  "Lainnya",
                                  style: AllMaterial.inter(
                                    color: AllMaterial.colorGreyPrim,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const PilihPaketView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AllMaterial.titleMenu(title: "Paket Haji & Umroh"),
                          IconButton(
                            onPressed: () {
                              Get.to(() => const PilihPaketView());
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Obx(
                        () {
                          var paket =
                              controller.package.value?.data?.length ?? 0;
                          if (paket > 0) {
                            return Row(
                              children: List.generate(paket, (index) {
                                var data =
                                    controller.package.value?.data?[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: AllMaterial.productItem(
                                    hargaPaket: (data?.package?.packagePrices !=
                                                null &&
                                            data!.package!.packagePrices!
                                                .isNotEmpty)
                                        ? 'Rp${NumberFormat('#,###', 'id_ID').format(data.package!.packagePrices![0].price)}'
                                        : 'Harga tidak tersedia',
                                    img: "${data?.package?.image}",
                                    jenisPaket: "${data?.package?.category}",
                                    namaPaket: "${data?.package?.name}",
                                    onTap: () {
                                      Get.to(
                                        () => const FocusProdukView(),
                                        arguments: {
                                          "idPackage": data?.package?.id ?? 0
                                        },
                                      );
                                    },
                                    rating: "${data?.avgRating ?? "0.0"}",
                                  ),
                                );
                              }),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AllMaterial.titleMenu(title: "Hubungi Admin"),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllMaterial.autoChatItem(
                                  svg: "assets/icon/terpercaya.svg",
                                  context: "terpercaya?",
                                  onTap: () {
                                    Get.to(() => const ChatListView());
                                  }),
                              const SizedBox(width: 10),
                              AllMaterial.autoChatItem(
                                svg: "assets/icon/cepat.svg",
                                context: "cepat?",
                                onTap: () {
                                  Get.to(() => const ChatListView());
                                },
                              ),
                              const SizedBox(width: 10),
                              AllMaterial.autoChatItem(
                                svg: "assets/icon/sigap.svg",
                                context: "sigap?",
                                onTap: () {
                                  Get.to(() => const ChatListView());
                                },
                              ),
                              const SizedBox(width: 10),
                              AllMaterial.autoChatItem(
                                svg: "assets/icon/update.svg",
                                context: "ter-update?",
                                onTap: () {
                                  Get.to(() => const ChatListView());
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Hubungi Admin",
        elevation: 1,
        backgroundColor: AllMaterial.colorPrimary,
        onPressed: () {
          Get.to(() => const ChatListView());
        },
        child: SvgPicture.asset(
          "assets/icon/chat.svg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
