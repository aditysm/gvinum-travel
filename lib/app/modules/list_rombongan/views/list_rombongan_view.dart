import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_rombongan_controller.dart';

class ListRombonganView extends GetView<ListRombonganController> {
  const ListRombonganView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListRombonganView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListRombonganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
