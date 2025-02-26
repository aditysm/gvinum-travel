import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';

import '../controllers/jadwal_manasik_controller.dart';

class JadwalManasikView extends GetView<JadwalManasikController> {
  const JadwalManasikView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Jadwal Manasik',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          "Tata Cara Umroh & Bacaan",
                          style: AllMaterial.inter(
                            fontWeight: AllMaterial.fontSemiBold,
                            color: AllMaterial.colorBlack,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllMaterial.titleMenu(
                              title: "Persiapan Ihram",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Mandi junub, memakai pakaian ihram, dan menggunakan parfum bagi laki-laki.",
                                "Laki-laki mengenakan dua lembar kain ihram, sedangkan wanita memakai pakaian syar’i tanpa cadar dan sarung tangan.",
                                "Berihram dari miqat dengan mengucapkan \"Labbaika ‘umroh\".",
                                "Jika khawatir tidak dapat menyelesaikan umroh karena sakit atau halangan lain, boleh membaca \"Allahumma mahilli haitsu habastani\".",
                                "Jika bertepatan dengan waktu shalat wajib, dianjurkan shalat terlebih dahulu sebelum berihram."
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Perjalanan Menuju Makkah",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Memperbanyak bacaan talbiyah dengan suara keras bagi laki-laki dan lirih bagi perempuan: \"Labbaik Allahumma labbaik. Labbaik laa syariika laka labbaik. Innalhamda wan ni’mata, laka wal mulk, laa syariika lak\".",
                                "Disunnahkan mandi sebelum memasuki kota Makkah."
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Memasuki Masjidil Haram",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Masuk dengan mendahulukan kaki kanan dan membaca doa masuk masjid:\"Allahummaf tahlii abwaaba rohmatik\".",
                                "Menuju Hajar Aswad, menghadap dan membaca \"Allahu Akbar\" atau \"Bismillah Allahu Akbar\".",
                                "Jika memungkinkan, mengusap Hajar Aswad dengan tangan kanan dan menciumnya. Jika tidak, cukup beri isyarat dengan tangan tanpa mencium tangan tersebut."
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Thawaf (Mengelilingi Ka’bah)",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Thawaf dilakukan sebanyak 7 putaran dimulai dan diakhiri di Hajar Aswad.",
                                "Pada tiga putaran pertama, laki-laki disunnahkan berlari-lari kecil, kemudian berjalan biasa pada empat putaran terakhir.",
                                "Mengusap Rukun Yamani jika memungkinkan, tanpa mencium atau memberi isyarat jika tidak dapat menyentuhnya.",
                                "Di antara Rukun Yamani dan Hajar Aswad, dianjurkan membaca: \"Robbana aatina fid dunya hasanah, wa fil aakhiroti hasanah wa qina ‘adzaban naar\".",
                                "Tidak ada bacaan khusus selama thawaf selain doa di atas, tetapi boleh membaca Al-Qur’an, dzikir, atau doa lainnya."
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Setelah Thawaf",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Menutup kedua pundak dan menuju Maqam Ibrahim sambil membaca: \"Wattakhodzu mim maqoomi ibroohiima musholla\".",
                                "Shalat sunnah thawaf dua rakaat di belakang Maqam Ibrahim:\n- Rakaat pertama setelah Al-Fatihah membaca surat Al-Kafirun.\n- Rakaat kedua setelah Al-Fatihah membaca surat Al-Ikhlas.",
                                "Minum air zam-zam dan menyiramkannya ke kepala.",
                                "Menuju Hajar Aswad kembali untuk bertakbir, mengusap, atau memberi isyarat jika tidak memungkinkan menyentuhnya.",
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Sa’i antara Bukit Shafa dan Marwah",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Menuju Bukit Shafa dan membaca: "Innash shafaa wal marwata min sya’airillah", lalu: "Nabda’u bimaa badaa-allahu bih".',
                                'Naik ke Bukit Shafa, menghadap Ka’bah, dan membaca: "Allahu Akbar" (3x), kemudian: "Laa ilaaha illallah wahdahu laa syarikalah lahul mulk walahul hamd, yuhyi wayumit wahuwa ‘ala kulli syai’in qadir, laa ilaaha illallahu wahdah anjaza wa’dah wanashoro abdah wahazamul ahzaaba wahdah".',
                                'Doa ini diulang sebanyak tiga kali dengan doa tambahan di antara pengulangan.',
                                'Turun dari Shafa menuju Marwah sambil berjalan dan berlari kecil di antara dua tanda lampu hijau bagi laki-laki.',
                                'Sampai di Marwah, menghadap Ka’bah dan membaca bacaan yang sama seperti di Shafa.',
                                'Perjalanan dari Shafa ke Marwah dihitung sebagai satu putaran.',
                                'Melakukan perjalanan ini sebanyak 7 putaran, dengan akhir di Marwah.',
                                'Tidak ada bacaan khusus saat sa’i, tetapi boleh berdzikir, berdoa, atau membaca Al-Qur’an.',
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Tahallul (Mencukur Rambut)",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Mencukur rambut (gundul lebih utama) bagi laki-laki.',
                                'Wanita cukup memotong rambut sepanjang satu ruas jari.',
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            AllMaterial.titleMenu(
                              title: "Umroh Selesai",
                              fontSize: 14,
                              height: 13,
                              width: 3,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Setelah tahallul, umroh selesai dan semua larangan ihram telah gugur.',
                              ]
                                  .map((item) => Text("• $item",
                                      textAlign: TextAlign.justify,
                                      style: AllMaterial.inter()))
                                  .toList(),
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
