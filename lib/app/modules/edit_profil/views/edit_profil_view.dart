import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProfilView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditProfilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
