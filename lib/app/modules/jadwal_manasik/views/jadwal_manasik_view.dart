import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_manasik_controller.dart';

class JadwalManasikView extends GetView<JadwalManasikController> {
  const JadwalManasikView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JadwalManasikView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JadwalManasikView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
