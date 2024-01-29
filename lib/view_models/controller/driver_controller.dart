import 'dart:developer';

import 'package:admin_sabji/data/repository/driver_repository.dart';
import 'package:admin_sabji/res/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class DriverController extends GetxController {
  RxList<dynamic> drivers = <dynamic>[].obs;
  RxBool isLoading = false.obs;

  final _api = DriverRepository();
  @override
  void onInit() {
    refreshData();
    super.onInit();
    getDriversData();
  }

  Future<void> refreshData() async {
    await getDriversData();
  }

  Future<void> getDriversData() async {
    isLoading.value = true;
    try {
      await _api.getDriverrep().then((value) {
        isLoading.value = false;
        drivers.value = value[AppConstants.result];
      }).onError((error, stackTrace) {
        isLoading.value = false;
        log(("we have got an error in drivers ${error.toString()}"));
        Utils.snackBar('Error', error.toString());
      });
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
