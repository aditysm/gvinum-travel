import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:intl/intl.dart';

import '../controllers/list_rombongan_controller.dart';

class ListRombonganView extends GetView<ListRombonganController> {
  const ListRombonganView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(ListRombonganController());
    var arg = Get.arguments;
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
              _buildTitleSection(arg),
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

  Widget _buildTitleSection(dynamic arg) {
    return Column(
      children: [
        Text(
          "${arg["namePackage"] ?? ""}",
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
                text: DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                    .format(arg["departurePackage"]),
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
    return Obx(
      () {
        List<int> terisi =
            List.generate(controller.countFilled.value, (index) => index + 1);
        List<int> terbooking =
            List.generate(controller.countBooking.value, (index) => index + 1);
        List<int> totalSeats = List.generate(
            controller.countAvailable.value, (index) => index + 1);

        return LayoutBuilder(
          builder: (context, constraints) {
            double totalWidth = constraints.maxWidth;
            double seatWidth = 45;
            double seatSpacing = 10;
            double seatRowWidth = (seatWidth * 2) + seatSpacing;

            int totalRows = (totalSeats.length / 4).ceil();

            return Column(
              children: List.generate(totalRows, (row) {
                int startIndex = row * 4;
                int endIndex = (startIndex + 4 > totalSeats.length)
                    ? totalSeats.length
                    : startIndex + 4;

                List<int> rowSeats = totalSeats.sublist(startIndex, endIndex);

                List<int> leftSeats =
                    rowSeats.length >= 2 ? rowSeats.sublist(0, 2) : rowSeats;
                List<int> rightSeats =
                    rowSeats.length > 2 ? rowSeats.sublist(2) : [];

                double remainingSpace = (totalWidth - (seatRowWidth * 2)) / 2;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSeatRow(leftSeats, terisi, terbooking),
                      SizedBox(width: remainingSpace),
                      _buildSeatRow(rightSeats, terisi, terbooking),
                    ],
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }

  Widget _buildSeatRow(
      List<int> seats, List<int> terisi, List<int> terbooking) {
    return Row(
      children: seats
          .map((seat) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: _buildSeat(seat, terisi, terbooking),
              ))
          .toList(),
    );
  }

  Widget _buildSeat(int seat, List<int> terisi, List<int> terbooking) {
    bool isTerisi = terisi.contains(seat);
    bool isTerbooking = terbooking.contains(seat);

    return Container(
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
        seat.toString(),
        style: AllMaterial.inter(
          fontSize: 16,
          color: isTerisi
              ? Colors.white
              : isTerbooking
                  ? AllMaterial.colorPrimary
                  : AllMaterial.colorGreyPrim,
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Obx(
      () {
        var user = controller.rombongan.value?.data?.user?.length;
        return AllMaterial.cusButton(
          label: "Cek Rombongan",
          onTap: user == 0
              ? null
              : () {
                  AllMaterial.detilKonten(
                    addSubtitle: false,
                    konten: SizedBox(
                      height: Get.height * 0.6,
                      child: ListView.builder(
                        itemCount:
                            controller.rombongan.value?.data?.user?.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            overflow: TextOverflow.ellipsis,
                            "${controller.rombongan.value?.data?.user?[index].name}",
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
      },
    );
  }
}
