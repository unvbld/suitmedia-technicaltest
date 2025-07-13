import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/second_screen_controller.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  const SecondScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Second Screen',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF04021D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF2B637B),
          ),
          onPressed: () => Get.back(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFE2E3E4),
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 13),
            // Welcome text
            const Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF04021D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            
            // User name
            Obx(() => Text(
              controller.userName.value,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF04021D),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )),
            
            // Spacer to center the Selected User Name
            const Spacer(),
            
            // Selected User Name (centered)
            Center(
              child: Obx(() => Text(
                controller.selectedUserName.value,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF04021D),
                  fontSize:24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            
            const Spacer(),
            
            // Choose a User button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: controller.goToThirdScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Choose a User',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
