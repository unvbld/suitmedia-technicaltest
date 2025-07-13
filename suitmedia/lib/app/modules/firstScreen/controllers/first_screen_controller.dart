import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class FirstScreenController extends GetxController {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    palindromeController.dispose();
    super.onClose();
  }

  bool isPalindrome(String text) {
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }

  void checkPalindrome() {
    String text = palindromeController.text.trim();
    if (text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter text to check',
        backgroundColor: const Color(0xFF2B637B),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        titleText: const Text(
          'Error',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: const Text(
          'Please enter text to check',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
      return;
    }

    bool isTextPalindrome = isPalindrome(text);
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Result',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF04021D),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          isTextPalindrome ? 'isPalindrome' : 'not palindrome',
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF686777),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF2B637B),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToSecondScreen() {
    String name = nameController.text.trim();
    if (name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        backgroundColor: const Color(0xFF2B637B),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        titleText: const Text(
          'Error',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: const Text(
          'Please enter your name',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
      return;
    }
    Get.toNamed(Routes.secondScreen, arguments: {'name': name});
  }
}
