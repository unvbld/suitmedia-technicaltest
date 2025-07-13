import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/third_screen_controller.dart';

class ThirdScreenView extends GetView<ThirdScreenController> {
  const ThirdScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThirdScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ThirdScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
