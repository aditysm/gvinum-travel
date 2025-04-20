import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/home_page/views/home_view.dart';
import 'package:gvinum_travel/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:gvinum_travel/app/modules/login_page/views/login_page_view.dart';
import 'package:gvinum_travel/app/services/firebase_service.dart';
import 'package:gvinum_travel/app/services/notification_service.dart';
import 'package:gvinum_travel/app/services/socket_service.dart';
import 'package:gvinum_travel/app/widgets/splash_screen/cusplash_screen_view.dart';
import 'package:gvinum_travel/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SocketService.init();
  final pushService = PushNotificationService();
  await pushService.init();
  setupFirebaseMessaging();
  pushService.listenToSocketNotification();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Gvinum Travel",
      getPages: AppPages.routes,
      theme: ThemeData(
        colorSchemeSeed: AllMaterial.colorPrimary,
      ),
      locale: const Locale('id_ID'),
      debugShowCheckedModeBanner: false,
      home: const InitPage(),
    );
  }
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> with WidgetsBindingObserver {
  bool showSplash = true;
  final LoginPageController logController = Get.put(LoginPageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
        logController.checkAuthentication();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      setState(
        () {
          showSplash = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return const CusplashScreen();
    } else {
      return Obx(
        () {
          if (logController.isAuth.value) {
            return const HomeView();
          } else {
            return const LoginPageView();
          }
        },
      );
    }
  }
}
