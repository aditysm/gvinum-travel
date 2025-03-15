import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/chat_room/controllers/chat_room_controller.dart';
import 'package:gvinum_travel/app/modules/chat_room/views/chat_room_view.dart';
import 'package:gvinum_travel/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:gvinum_travel/app/modules/jadwal_manasik/views/jadwal_manasik_view.dart';
import 'package:gvinum_travel/app/modules/list_rombongan/views/list_rombongan_view.dart';
import 'package:gvinum_travel/app/modules/login_page/views/login_page_view.dart';
import 'package:gvinum_travel/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:gvinum_travel/app/modules/pengaturan/views/pengaturan_view.dart';
import 'package:gvinum_travel/app/modules/perjalanan_saya/views/perjalanan_saya_view.dart';
import 'package:gvinum_travel/app/modules/pilih_paket/views/pilih_paket_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final chatCont = Get.put(ChatRoomController());
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
          IconButton(
            icon: SvgPicture.asset(
              'assets/icon/notification.svg',
            ),
            onPressed: () {
              Get.to(() => const NotifikasiView());
            },
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
                const CircleAvatar(
                  radius: 30,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Habil Arlian Asrori",
                          style: AllMaterial.inter(
                            fontWeight: AllMaterial.fontSemiBold,
                            color: AllMaterial.colorBlack,
                            fontSize: 16,
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
                    Text(
                      "aabiljr@gmail.com",
                      style: AllMaterial.inter(
                        fontWeight: AllMaterial.fontMedium,
                        color: AllMaterial.colorGreyPrim,
                      ),
                    ),
                  ],
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
                Get.to(() => const PerjalananSayaView(), arguments: {
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
                Get.to(() => const ListRombonganView());
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
                Get.back();
                Get.to(() => const LoginPageView());
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
                        Get.to(() => const ChatRoomView());
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
                            phone: "6285728565172",
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
                              Get.to(() => const ListRombonganView());
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
                      child: Row(
                        children: [
                          AllMaterial.productItem(
                            hargaPaket: "21.000.000",
                            img: "assets/images/login.jpg",
                            jenisPaket: "Umrah",
                            namaPaket: "Umrah Winter Regular",
                            onTap: () {
                              Get.to(() => const PerjalananSayaView(), arguments: {
                                "isPerjalananSaya": false,
                              });
                            },
                            rating: "4.1",
                          ),
                          const SizedBox(width: 5),
                          AllMaterial.productItem(
                            hargaPaket: "21.000.000",
                            img: "assets/images/login.jpg",
                            jenisPaket: "Umrah",
                            namaPaket: "Umrah Winter Regular",
                            onTap: () {
                              Get.to(() => const PerjalananSayaView(), arguments: {
                                "isPerjalananSaya": false,
                              });
                            },
                            rating: "4.4",
                          ),
                          const SizedBox(width: 5),
                          AllMaterial.productItem(
                            hargaPaket: "21.000.000",
                            img: "assets/images/login.jpg",
                            jenisPaket: "Umrah",
                            namaPaket: "Umrah Winter Regular",
                            onTap: () {
                              Get.to(() => const PerjalananSayaView(), arguments: {
                                "isPerjalananSaya": false,
                              });
                            },
                            rating: "4.5",
                          ),
                          const SizedBox(width: 5),
                        ],
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
                                  onTap: () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    Get.to(() => const ChatRoomView());
                                    chatCont.sendAutoChat(
                                        "Apakah Gvinum Travel terpercaya?");
                                  }),
                              const SizedBox(width: 10),
                              AllMaterial.autoChatItem(
                                svg: "assets/icon/cepat.svg",
                                context: "cepat?",
                                onTap: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  Get.to(() => const ChatRoomView());
                                  chatCont.sendAutoChat(
                                      "Apakah Gvinum Travel cepat?");
                                },
                              ),
                              const SizedBox(width: 10),
                              AllMaterial.autoChatItem(
                                svg: "assets/icon/sigap.svg",
                                context: "sigap?",
                                onTap: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  Get.to(() => const ChatRoomView());
                                  chatCont.sendAutoChat(
                                      "Apakah Gvinum Travel sigap?");
                                },
                              ),
                              const SizedBox(width: 10),
                              AllMaterial.autoChatItem(
                                svg: "assets/icon/update.svg",
                                context: "ter-update?",
                                onTap: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  Get.to(() => const ChatRoomView());
                                  chatCont.sendAutoChat(
                                      "Apakah Gvinum Travel ter-update?");
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
          Get.to(() => const ChatRoomView());
        },
        child: SvgPicture.asset(
          "assets/icon/chat.svg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
