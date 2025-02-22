import 'package:flutter/material.dart';
import 'package:gvinum_travel/all_material.dart';

class CusplashScreen extends StatelessWidget {
  const CusplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 105,
              height: 105,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Image.asset("assets/images/logo.png"),
            ),
            RichText(
              text: TextSpan(
                text: "Gvinum Travel",
                style: AllMaterial.inter(
                  color: AllMaterial.colorPrimary,
                  fontWeight: AllMaterial.fontSemiBold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
