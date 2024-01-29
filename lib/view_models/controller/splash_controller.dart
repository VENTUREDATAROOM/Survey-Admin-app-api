import 'dart:async';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class SplashController extends GetxController {
  void isLogin() {
    Timer(const Duration(seconds: 3),
        () => Get.offAndToNamed(RouteName.loginView));
  }
}
