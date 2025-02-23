import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pilih_paket_controller.dart';

class PilihPaketView extends GetView<PilihPaketController> {
  const PilihPaketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PilihPaketView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PilihPaketView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
