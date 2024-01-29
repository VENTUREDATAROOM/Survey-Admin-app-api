import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repository/registration_repository.dart';
import '../../res/constants/app_constants.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class RegistrationController extends GetxController {
  final _api = RegisterRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  final aadharController = TextEditingController().obs;
  RxBool loading = false.obs;

  void registerApi() {
    loading.value = true;
    Map data = {
      'mobileno': mobileController.value.text,
      "name": nameController.value.text,
      "dateofbirth": dobController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'flgOfUser': 'y',
      "aadharNo": aadharController.value.text
    };

    _api.registerApi(data).then((value) {
      loading.value = false;
      Utils.snackBar('Registration', value['message']);
      if (value[AppConstants.requestCustomCode] == "200") {
        Get.toNamed(RouteName.loginView);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  String _userRole = 'Surveyer';
  String get userRole => _userRole;
  void setUserRole(String value) {
    _userRole = value;
    if (kDebugMode) {
      print(_userRole);
    }
    update();
  }
}
