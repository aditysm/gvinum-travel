import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
  static const colorSecondary = Color(0xffCCF9DB);
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
    Widget? icon,
    bool addIcon = true,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(
        "$label",
        style: AllMaterial.inter(
          color: AllMaterial.colorWhite,
          fontSize: 16,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      icon: addIcon == true ? icon : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AllMaterial.colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        fixedSize: Size(Get.width, 50),
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
                    color: AllMaterial.colorSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset("assets/svg/notif.svg"),
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
                color: AllMaterial.colorGreySec,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AllMaterial.colorPrimary,
              size: 16,
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
    IconData? icon,
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
            leading: Icon(
              icon,
              color: AllMaterial.colorPrimary,
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
              Icons.arrow_forward_ios_rounded,
              color: AllMaterial.colorPrimary,
              size: 16,
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
    Widget? customButtonWidget,
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
            child: Column(
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
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                addSubtitle == false
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 20),
                SizedBox(child: konten),
                const SizedBox(height: 20),
                customButton == false
                    ? AllMaterial.cusButton(
                        icon: icon,
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
          duration: const Duration(seconds: 2),
          content: Text(
            title,
            style: AllMaterial.inter(),
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
