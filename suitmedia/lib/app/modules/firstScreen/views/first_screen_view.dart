import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/first_screen_controller.dart';

class FirstScreenView extends GetView<FirstScreenController> {
  const FirstScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FirstScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
