import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SecondScreenController extends GetxController {
  final RxString userName = ''.obs;
  final RxString selectedUserName = 'Selected User Name'.obs;

  @override
  void onInit() {
    super.onInit();
    // Get the name from arguments
    final arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null && arguments['name'] != null) {
      userName.value = arguments['name'];
    }
  }

  void goToThirdScreen() async {
    final result = await Get.toNamed(Routes.thirdScreen);
    if (result != null && result is String) {
      selectedUserName.value = result;
    }
  }
}
