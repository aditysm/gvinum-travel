import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';

import '../controllers/list_rombongan_controller.dart';

class ListRombonganView extends GetView<ListRombonganController> {
  const ListRombonganView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'List Rombongan',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildStatusIndicatorRow(),
              const SizedBox(height: 30),
              _buildTitleSection(),
              const SizedBox(height: 20),
              Expanded(child: SingleChildScrollView(child: _buildSeatGrid())),
              _buildBottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicatorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatusIndicator(
          color: AllMaterial.colorPrimary,
          text: "Terisi",
        ),
        const SizedBox(width: 16),
        _buildStatusIndicator(
          borderColor: AllMaterial.colorPrimary,
          text: "Ter-booking",
        ),
        const SizedBox(width: 16),
        _buildStatusIndicator(
          color: AllMaterial.colorGreySec,
          text: "Tersedia",
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          "Umrah Winter Regular",
          textAlign: TextAlign.center,
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontSize: 25,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            text: "Jadwal Keberangkatan : ",
            style: AllMaterial.inter(
              fontWeight: AllMaterial.fontMedium,
              color: AllMaterial.colorGreyPrim,
            ),
            children: [
              TextSpan(
                text: "3 Februari 2025",
                style: AllMaterial.inter(
                  fontWeight: AllMaterial.fontMedium,
                  color: AllMaterial.colorSoftPrimary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator({
    Color? color,
    Color? borderColor,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: borderColor != null
                ? Border.all(width: 2, color: borderColor)
                : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: AllMaterial.inter(color: AllMaterial.colorGreyPrim),
        ),
      ],
    );
  }

  Widget _buildSeatGrid() {
    List<int> terisi = [1, 3, 5, 7];
    List<int> terbooking = [9, 11, 13, 15, 17, 19];
    List<int> totalSeats = List.generate(32, (index) => index + 1);

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: _generateSeats(totalSeats, terisi, terbooking),
    );
  }

  List<Widget> _generateSeats(
      List<int> seats, List<int> terisi, List<int> terbooking) {
    List<Widget> seatWidgets = [];
    for (int i = 0; i < seats.length; i++) {
      if (i % 4 == 2) {
        seatWidgets.add(const SizedBox(width: 80));
      }

      bool isTerisi = terisi.contains(seats[i]);
      bool isTerbooking = terbooking.contains(seats[i]);

      seatWidgets.add(Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: isTerisi
              ? AllMaterial.colorPrimary
              : isTerbooking
                  ? null
                  : AllMaterial.colorGreySec,
          borderRadius: BorderRadius.circular(10),
          border: isTerbooking
              ? Border.all(width: 2, color: AllMaterial.colorPrimary)
              : null,
        ),
        child: Text(
          seats[i].toString(),
          style: AllMaterial.inter(
            fontSize: 16,
            color: isTerisi
                ? Colors.white
                : isTerbooking
                    ? AllMaterial.colorPrimary
                    : AllMaterial.colorGreyPrim,
          ),
        ),
      ));
    }
    return seatWidgets;
  }

  Widget _buildBottomButton() {
    return AllMaterial.cusButton(
      label: "Cek Rombongan",
      onTap: () {
        AllMaterial.detilKonten(
          addSubtitle: false,
          konten: SizedBox(
            height: Get.height * 0.6,
            child: ListView.builder(
              itemCount: 32,
              itemBuilder: (context, index) => ListTile(
                trailing: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AllMaterial.colorPrimary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                title: Text(
                  "Mu'tamir Ke-${index + 1}",
                  style: AllMaterial.inter(
                    fontWeight: AllMaterial.fontMedium,
                    fontSize: 17,
                  ),
                ),
                dense: true,
                leading: Text(
                  "${index + 1}.",
                  style: AllMaterial.inter(
                    fontWeight: AllMaterial.fontBold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          title: "List Rombongan",
          buttonLabel: "Tutup List",
          onTap: () {
            Get.back();
          },
        );
      },
    );
  }
}
