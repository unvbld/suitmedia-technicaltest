import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user.dart';
import '../../../data/services/api_service.dart';

class ThirdScreenController extends GetxController {
  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasMoreData = true.obs;
  final RxString errorMessage = ''.obs;
  
  int currentPage = 1;
  final int perPage = 10;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadUsers();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll() {
    if (scrollController.position.pixels == 
        scrollController.position.maxScrollExtent) {
      if (hasMoreData.value && !isLoadingMore.value) {
        loadMoreUsers();
      }
    }
  }

  Future<void> loadUsers() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      currentPage = 1;
      
      final response = await ApiService.getUsers(
        page: currentPage, 
        perPage: perPage,
      );
      
      users.value = response.data;
      hasMoreData.value = response.page < response.totalPages;
      
    } catch (e) {
      errorMessage.value = e.toString();
      users.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreUsers() async {
    if (!hasMoreData.value || isLoadingMore.value) return;
    
    try {
      isLoadingMore.value = true;
      currentPage++;
      
      final response = await ApiService.getUsers(
        page: currentPage, 
        perPage: perPage,
      );
      
      users.addAll(response.data);
      hasMoreData.value = response.page < response.totalPages;
      
    } catch (e) {
      currentPage--; // Revert page increment on error
      Get.snackbar(
        'Error',
        'Failed to load more users',
        backgroundColor: const Color(0xFF2B637B),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
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
          'Failed to load more users',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> refreshUsers() async {
    await loadUsers();
  }

  void selectUser(User user) {
    Get.back(result: user.fullName);
  }
}
