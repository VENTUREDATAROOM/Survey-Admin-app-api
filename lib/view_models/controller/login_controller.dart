import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/login_repository.dart';
import '../../res/constants/app_constants.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  Future<void> loginApi() async {
    loading.value = true;
    Map data = {
      'username': emailController.value.text.toString(),
      'password': passwordController.value.text.toString()
    };
    var respData = await _api.loginApi(data);
    print("@@@@@@@@@@@@@@@@@@@@@" + respData.toString());
    loading.value = false;
    if (respData[AppConstants.requestCustomCode] == "200") {
      PreferenceUtils.setString(
          AppConstants.userId, emailController.value.text.toString());
      PreferenceUtils.setString(
          AppConstants.token, respData[AppConstants.requestToken]);
      Get.offAndToNamed(RouteName.profileView);
    } else {
      Utils.snackBar('Login Error', 'User Name And Password Did Not Match');
    }
  }
}
