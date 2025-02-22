import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/home/views/home_view.dart';
import 'package:gvinum_travel/app/widgets/splash_screen/cusplash_screen_view.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Gvinum Travel",
      getPages: AppPages.routes,
      theme: ThemeData(
        colorSchemeSeed: AllMaterial.colorPrimary,
      ),
      locale: const Locale('id_ID'),
      debugShowCheckedModeBanner: false,
      home: const InitPage(),
    ),
  );
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> with WidgetsBindingObserver {
  bool showSplash = true;
  // final LoginPageController logController = Get.put(LoginPageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
        // logController.checkAuthentication();
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
      setState(() {
        showSplash = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return const CusplashScreen();
    } else {
      return const HomeView();
      // return Obx(() {
      //   if (logController.isAuth.value) {
      //     return logController.periksaRole();
      //   } else {
      //     return const LoginPageView();
      //   }
      // });
    }
  }
}
