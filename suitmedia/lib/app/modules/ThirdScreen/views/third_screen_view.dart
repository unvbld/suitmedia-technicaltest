import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/third_screen_controller.dart';

class ThirdScreenView extends GetView<ThirdScreenController> {
  const ThirdScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Third Screen',
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
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF2B637B),
            ),
          );
        }

        if (controller.errorMessage.isNotEmpty && controller.users.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wifi_off,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Failed to load users',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF04021D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.errorMessage.value.contains('Network error') 
                        ? 'Please check your internet connection'
                        : 'Something went wrong. Please try again.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.loadUsers,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B637B),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Try Again',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (controller.users.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline,
                  size: 64,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'No users found',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshUsers,
          color: const Color(0xFF2B637B),
          child: ListView.separated(
            controller: controller.scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: controller.users.length + 
                (controller.isLoadingMore.value ? 1 : 0),
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xFFE2E3E4),
              height: 25,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              if (index == controller.users.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF2B637B),
                    ),
                  ),
                );
              }

              final user = controller.users[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 0,
                ),
                leading: CircleAvatar(
                  radius: 24.5,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(
                  '${user.firstName} ${user.lastName}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF04021D),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    user.email,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF686777),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () => controller.selectUser(user),
              );
            },
          ),
        );
      }),
    );
  }
}
