import 'package:get/get.dart';

import '../modules/ThirdScreen/bindings/third_screen_binding.dart';
import '../modules/ThirdScreen/views/third_screen_view.dart';
import '../modules/firstScreen/bindings/first_screen_binding.dart';
import '../modules/firstScreen/views/first_screen_view.dart';
import '../modules/secondScreen/bindings/second_screen_binding.dart';
import '../modules/secondScreen/views/second_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.firstScreen;

  static final routes = [
    GetPage(
      name: _Paths.firstScreen,
      page: () => const FirstScreenView(),
      binding: FirstScreenBinding(),
    ),
    GetPage(
      name: _Paths.secondScreen,
      page: () => const SecondScreenView(),
      binding: SecondScreenBinding(),
    ),
    GetPage(
      name: _Paths.thirdScreen,
      page: () => const ThirdScreenView(),
      binding: ThirdScreenBinding(),
    ),
  ];
}
