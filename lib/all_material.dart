// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AllMaterial {
  static var box = GetStorage();

  // Font Family
  static var inter = GoogleFonts.inter;

  // Font Weight
  static const fontExtraBold = FontWeight.w800;
  static const fontBold = FontWeight.w700;
  static const fontSemiBold = FontWeight.w600;
  static const fontMedium = FontWeight.w500;
  static const fontRegular = FontWeight.w400;

  // Color
  static const colorPrimary = Color(0xffFF3C3C);
  static const colorSoftPrimary = Color(0xffE57373);
  static const colorWhite = Colors.white;
  static const colorWhitePrimary = Color(0xffFBFBFB);
  static const colorBlack = Color(0xff0B0B0B);
  static const colorStroke = Color(0xffF3F4F5);
  static const colorGreySec = Color(0xffDAD4D5);
  static const colorGreyPrim = Color(0xff757575);
  static const colorBlue = Color(0xff2196F3);
  static const colorYellow = Color(0xffFFC000);
  static const colorGreen = Color(0xff66BB6A);

  // Linear Background
  static var linearBackground = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEAF5ED),
      Color(0xffffffff),
    ],
  );

  // Top Shadow
  static var topShadow = BoxShadow(
    color: const Color(0x00000000).withOpacity(0.06),
    offset: const Offset(0, -6),
    blurRadius: 24,
    spreadRadius: 5,
  );

  // Button
  static cusButton({
    String? label,
    void Function()? onTap,
    bool addIcon = false,
    Widget? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: SizedBox(
        width: Get.width,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AllMaterial.colorPrimary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: addIcon ? icon : null,
          onPressed: onTap,
          label: Text(
            "$label",
            style: AllMaterial.inter(
              color: Colors.white,
              fontWeight: AllMaterial.fontSemiBold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Text Field
  static textField(
      {FocusNode? focusNode,
      String? label,
      TextEditingController? controller}) {
    return TextField(
      selectionControls: MaterialTextSelectionControls(),
      controller: controller,
      focusNode: focusNode,
      cursorColor: AllMaterial.colorPrimary,
      textInputAction: TextInputAction.next,
      onTapOutside: (_) {
        focusNode!.unfocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AllMaterial.colorPrimary,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hoverColor: AllMaterial.colorPrimary,
        labelText: label,
        labelStyle: AllMaterial.inter(
          color: AllMaterial.colorBlack.withOpacity(0.6),
          fontWeight: AllMaterial.fontMedium,
        ),
        focusColor: AllMaterial.colorPrimary,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffF1ECEC),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  // Text Outline
  static outlineText({String? title, String? subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: AllMaterial.colorSoftPrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AllMaterial.colorStroke,
        ),
      ),
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: AllMaterial.inter(
              color: AllMaterial.colorPrimary,
              fontWeight: AllMaterial.fontSemiBold,
            ),
          ),
          Text(
            "$subtitle",
            style: AllMaterial.inter(
              color: AllMaterial.colorBlack,
              fontSize: 18,
              fontWeight: AllMaterial.fontSemiBold,
            ),
          ),
        ],
      ),
    );
  }

  // NOTIF WIDGET
  static notifWidget({
    String? atas,
    String? bawah,
    bool dibaca = false,
    void Function()? onTap,
  }) {
    return Material(
      color: const Color(0xffF9FDFA),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: AllMaterial.colorPrimary,
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: AllMaterial.colorSoftPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset("assets/icon/notif.svg"),
                ),
              ],
            ),
            title: Text(
              "$atas",
              style: AllMaterial.inter(
                fontWeight: AllMaterial.fontSemiBold,
                fontSize: 18,
                color: AllMaterial.colorBlack,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              "$bawah",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: AllMaterial.inter(
                color: AllMaterial.colorGreyPrim,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // SETTINGS WIDGET
  static settingWidget({
    String? title,
    void Function()? onTap,
    String? svg,
  }) {
    return Material(
      color: AllMaterial.colorWhitePrimary,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(
              "$svg",
              // height: 22,
              width: 22,
              color: AllMaterial.colorBlack,
            ),
            title: Text(
              "$title",
              style: AllMaterial.inter(
                fontWeight: AllMaterial.fontMedium,
                color: AllMaterial.colorBlack,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: const Icon(
              Icons.arrow_forward,
              color: AllMaterial.colorBlack,
            ),
          ),
        ),
      ),
    );
  }

  // ICON WIDGET
  static iconWidget({String? title, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        right: 5,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: AllMaterial.colorSoftPrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AllMaterial.colorStroke,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AllMaterial.colorPrimary,
          ),
          const SizedBox(width: 4),
          Text(
            "$title",
            style: AllMaterial.inter(
              color: AllMaterial.colorPrimary,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
        ],
      ),
    );
  }

  // DETAIL BOTTOM SHEET
  static detilKonten({
    Widget? icon,
    String? buttonLabel,
    String? title,
    String? subtitle,
    Widget? konten,
    bool addSubtitle = true,
    bool customButton = false,
    bool customDetil = false,
    Widget? customButtonWidget,
    Widget? customDetilWidget,
    void Function()? onTap,
  }) {
    return Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: customDetil
                ? customDetilWidget
                : Column(
                    mainAxisSize: MainAxisSize.min,
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
                      Text(
                        "$title",
                        style: AllMaterial.inter(
                          fontSize: 25,
                          fontWeight: AllMaterial.fontMedium,
                        ),
                      ),
                      const SizedBox(height: 10),
                      addSubtitle == false
                          ? const SizedBox.shrink()
                          : Text(
                              "$subtitle",
                              style: AllMaterial.inter(
                                fontWeight: AllMaterial.fontMedium,
                                color: AllMaterial.colorGreyPrim,
                              ),
                            ),
                      addSubtitle == false
                          ? const SizedBox.shrink()
                          : const SizedBox(height: 20),
                      SizedBox(child: konten),
                      const SizedBox(height: 20),
                      customButton == false
                          ? AllMaterial.cusButton(
                              label: "$buttonLabel",
                              onTap: onTap,
                            )
                          : customButtonWidget
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // To WhatsApp
  static void openWhatsApp({required String phone, String? message}) async {
    String url =
        "https://wa.me/$phone?text=${Uri.encodeComponent(message ?? '')}";

    if (await canLaunch(url)) {
      await launchUrl(Uri.parse(url));
    } else {
      messageScaffold(title: "Tidak dapat mengakses WhatsApp");
    }
  }

  // Profile Widget
  static editableWidget({
    FocusNode? focusNode,
    String? label,
    TextEditingController? controller,
    int maxLines = 1,
    bool addRowButton = false,
    String? rowButtonLabel,
    String? hintText,
    bool readOnly = false,
    void Function()? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$label",
              style: AllMaterial.inter(
                fontWeight: AllMaterial.fontMedium,
                fontSize: 14,
                color: AllMaterial.colorGreySec,
              ),
            ),
            addRowButton == true
                ? TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      overlayColor: AllMaterial.colorPrimary,
                    ),
                    onPressed: onTap,
                    child: Text(
                      "$rowButtonLabel",
                      style: AllMaterial.inter(
                        fontWeight: AllMaterial.fontMedium,
                        fontSize: 14,
                        color: AllMaterial.colorBlack,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          readOnly: readOnly,
          controller: controller,
          focusNode: focusNode,
          maxLines: maxLines,
          cursorColor: AllMaterial.colorPrimary,
          textInputAction: TextInputAction.next,
          onTapOutside: (_) {
            focusNode!.unfocus();
          },
          style: AllMaterial.inter(
            color: AllMaterial.colorGreySec,
          ),
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AllMaterial.colorGreySec,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            hintStyle: AllMaterial.inter(
              color: AllMaterial.colorGreySec,
              fontWeight: AllMaterial.fontRegular,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEDF2EE),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: readOnly == false
                ? null
                : OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AllMaterial.colorPrimary,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
            hoverColor: readOnly == false ? null : AllMaterial.colorPrimary,
            focusColor: readOnly == false ? null : AllMaterial.colorPrimary,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEDF2EE),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  // Product Item
  static productItem({
    String? img,
    String? rating,
    String? namaPaket,
    String? jenisPaket,
    String? hargaPaket,
    void Function()? onTap,
  }) {
    return Ink(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AllMaterial.colorStroke),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Stack(
                    children: [
                      Image.network(
                        img?.replaceAll(
                              "localhost",
                              ApiUrl.baseUrl,
                            ) ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s",
                        errorBuilder: (context, error, stackTrace) {
                          return SvgPicture.asset(
                            "assets/icon/kaaba.svg",
                            color: AllMaterial.colorGreyPrim,
                          );
                        },
                      ),
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: AllMaterial.colorWhite,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "$rating",
                              style: AllMaterial.inter(
                                  color: AllMaterial.colorWhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$namaPaket",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AllMaterial.inter(
                          fontWeight: AllMaterial.fontSemiBold,
                          color: AllMaterial.colorBlack,
                        ),
                      ),
                      Text(
                        "Paket $jenisPaket",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            AllMaterial.inter(color: AllMaterial.colorGreyPrim),
                      ),
                      Text(
                        "$hargaPaket",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }

  // Title Menu
  static titleMenu(
      {String? title,
      double fontSize = 18,
      double width = 3,
      double height = 20}) {
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AllMaterial.colorPrimary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "$title",
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }

  // Drawer Item
  static drawerItem({
    Color warnaBackground = colorWhite,
    Color warnaText = colorGreyPrim,
    Color warnaSvg = colorGreyPrim,
    String? svg,
    String? title,
    void Function()? onTap,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: warnaBackground,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SvgPicture.asset(
                color: warnaSvg,
                height: 24,
                "$svg",
              ),
              const SizedBox(width: 10),
              Text(
                "$title",
                style: AllMaterial.inter(
                  color: warnaText,
                  fontSize: 15,
                  fontWeight: AllMaterial.fontSemiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Pintasan Cepat
  static autoChatItem({
    String? context,
    String? svg,
    void Function()? onTap,
  }) {
    return Material(
      color: AllMaterial.colorWhite,
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: onTap,
        child: Container(
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: AllMaterial.colorStroke,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Apakah\n",
                          style: AllMaterial.inter(
                            color: AllMaterial.colorBlack,
                          ),
                          children: [
                            TextSpan(
                                text: "Gvinum Travel\n",
                                style: AllMaterial.inter(
                                  color: AllMaterial.colorBlack,
                                  fontWeight: AllMaterial.fontBold,
                                )),
                            TextSpan(
                              text: "$context",
                              style: AllMaterial.inter(
                                color: AllMaterial.colorBlack,
                              ),
                            ),
                          ]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AllMaterial.colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SvgPicture.asset(
                "$svg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown Item
  static dropDownWidget({
    FocusNode? focusNode,
    String? label,
    TextEditingController? controller,
    int maxLines = 1,
    bool addRowButton = false,
    String? rowButtonLabel,
    String? hintText,
    bool readOnly = false,
    void Function()? onTap,
    required List<String> dropdownItems,
    String? selectedValue,
    void Function(String?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$label",
              style: AllMaterial.inter(
                fontWeight: AllMaterial.fontMedium,
                fontSize: 14,
                color: AllMaterial.colorGreySec,
              ),
            ),
            addRowButton == true
                ? TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      overlayColor: AllMaterial.colorPrimary,
                    ),
                    onPressed: onTap,
                    child: Text(
                      "$rowButtonLabel",
                      style: AllMaterial.inter(
                        fontWeight: AllMaterial.fontMedium,
                        fontSize: 14,
                        color: AllMaterial.colorBlack,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AllMaterial.inter(
                  color: AllMaterial.colorGreySec,
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AllMaterial.colorGreySec,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            hintStyle: AllMaterial.inter(
              color: AllMaterial.colorGreySec,
              fontWeight: AllMaterial.fontRegular,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEDF2EE),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: readOnly == false
                ? null
                : OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AllMaterial.colorPrimary,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
            hoverColor: readOnly == false ? null : AllMaterial.colorPrimary,
            focusColor: readOnly == false ? null : AllMaterial.colorPrimary,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffEDF2EE),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  // Message Scaffold
  static void messageScaffold({required String title}) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          backgroundColor: AllMaterial.colorBlack,
          duration: const Duration(seconds: 2),
          content: Text(
            title,
            style: AllMaterial.inter(color: AllMaterial.colorWhite),
          ),
        ),
      );
    }
  }

  // DIALOG
  static void cusDialogValidasi({
    required String title,
    required String subtitle,
    required VoidCallback? onConfirm,
    required VoidCallback? onCancel,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: AllMaterial.colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AllMaterial.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AllMaterial.inter(
                  fontSize: 16,
                  fontWeight: AllMaterial.fontMedium,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AllMaterial.colorPrimary,
                        side: const BorderSide(color: AllMaterial.colorPrimary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Batalkan',
                        style: AllMaterial.inter(
                          fontWeight: AllMaterial.fontMedium,
                          color: AllMaterial.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllMaterial.colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Konfirmasi',
                        style: AllMaterial.inter(
                          fontWeight: AllMaterial.fontMedium,
                          color: AllMaterial.colorWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Format = Senin, 21 Januari 2025
  static String hariTanggalBulanTahun(String isoDate) {
    DateTime parsedDate = DateTime.parse(isoDate);
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);

    return formattedDate;
  }

  // Format = 2025-02-02
  static String tahunBulanTanggal(String dateString) {
    DateTime parsedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').parse(dateString);
    String isoFormatDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    return isoFormatDate;
  }

  // Format = 21:20
  static String jamMenit(String? waktu) {
    if (waktu == null || waktu.isEmpty) {
      return 'Belum Ditentukan';
    }
    try {
      final parsedTime = DateFormat('HH:mm').parse(waktu);
      return DateFormat('HH:mm').format(parsedTime);
    } catch (e) {
      return 'Format Tidak Valid';
    }
  }

  // Format Nama Panjang = James Werren A.G.H
  static String formatNamaPanjang(String namaPanjang) {
    List<String> namaArray = namaPanjang.split(' ');
    List<String> namaTigaPertama = namaArray.take(3).toList();
    List<String> inisialSisa =
        namaArray.skip(3).map((nama) => '${nama[0]}.').toList();

    return (namaTigaPertama + inisialSisa).join(' ');
  }

  static String formatEmail(String email) {
    if (!email.contains('@')) return email;

    String namaEmail = email.split('@')[0];
    String hasil =
        namaEmail.length > 10 ? '${namaEmail.substring(0, 10)}...' : namaEmail;

    return '$hasil@gmail.com';
  }

  static String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Permintaan tidak valid. Periksa input Kamu.";
      case 401:
        return "Kamu tidak memiliki akses. Silakan login.";
      case 403:
        return "Kamu tidak diizinkan untuk mengakses halaman ini.";
      case 404:
        return "Data tidak ditemukan.";
      case 408:
        return "Waktu habis. Silakan coba lagi.";
      case 500:
        return "Terjadi kesalahan pada server. Silakan coba lagi nanti.";
      case 502:
        return "Server sedang tidak dapat diakses. Coba lagi nanti.";
      case 503:
        return "Layanan sedang tidak tersedia. Silakan coba beberapa saat lagi.";
      case 504:
        return "Server tidak merespons tepat waktu. Silakan coba lagi.";
      default:
        return "Terjadi kesalahan tidak diketahui.";
    }
  }
}
