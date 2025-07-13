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

  static const INITIAL = Routes.FIRST_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.FIRST_SCREEN,
      page: () => const FirstScreenView(),
      binding: FirstScreenBinding(),
    ),
    GetPage(
      name: _Paths.SECOND_SCREEN,
      page: () => const SecondScreenView(),
      binding: SecondScreenBinding(),
    ),
    GetPage(
      name: _Paths.THIRD_SCREEN,
      page: () => const ThirdScreenView(),
      binding: ThirdScreenBinding(),
    ),
  ];
}
