import 'package:get/get.dart';

import '../modules/chat_room/bindings/chat_room_binding.dart';
import '../modules/chat_room/views/chat_room_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal_manasik/bindings/jadwal_manasik_binding.dart';
import '../modules/jadwal_manasik/views/jadwal_manasik_view.dart';
import '../modules/list_rombongan/bindings/list_rombongan_binding.dart';
import '../modules/list_rombongan/views/list_rombongan_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pengaturan/bindings/pengaturan_binding.dart';
import '../modules/pengaturan/views/pengaturan_view.dart';
import '../modules/perjalanan_saya/bindings/perjalanan_saya_binding.dart';
import '../modules/perjalanan_saya/views/perjalanan_saya_view.dart';
import '../modules/pilih_paket/bindings/pilih_paket_binding.dart';
import '../modules/pilih_paket/views/pilih_paket_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.PERJALANAN_SAYA,
      page: () => const PerjalananSayaView(),
      binding: PerjalananSayaBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ROMBONGAN,
      page: () => const ListRombonganView(),
      binding: ListRombonganBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_MANASIK,
      page: () => const JadwalManasikView(),
      binding: JadwalManasikBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_PAKET,
      page: () => const PilihPaketView(),
      binding: PilihPaketBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => const ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN,
      page: () => const PengaturanView(),
      binding: PengaturanBinding(),
    ),
  ];
}
