import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Icon(Icons.check),
            )
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
                            onPressed: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AllMaterial.colorStroke,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/login.jpg"),
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AllMaterial.colorWhite,
                                      ),
                                      Text(
                                        "4.2",
                                        style: AllMaterial.inter(
                                          color: AllMaterial.colorWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 9,
                                  left: 9,
                                  bottom: 25,
                                  right: 9,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Umrah Winter Regular",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AllMaterial.inter(
                                        fontWeight: AllMaterial.fontSemiBold,
                                        color: AllMaterial.colorBlack,
                                      ),
                                    ),
                                    Text(
                                      "Paket Umrah",
                                      style: AllMaterial.inter(
                                        color: AllMaterial.colorGreyPrim,
                                      ),
                                    ),
                                    Text(
                                      "Rp. 21.000.000",
                                      style: AllMaterial.inter(
                                        fontSize: 16,
                                        color: AllMaterial.colorPrimary,
                                        fontWeight: AllMaterial.fontSemiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
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
        onPressed: () {},
        child: SvgPicture.asset(
          "assets/icon/chat.svg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
