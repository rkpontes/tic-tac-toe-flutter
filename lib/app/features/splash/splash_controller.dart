import 'dart:async';

import 'package:get/get.dart';
import 'package:tic_tac_toe/app/core/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1), () {
      Get.offNamed(Routes.GAME);
    });
  }
}
