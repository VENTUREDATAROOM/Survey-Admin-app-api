import 'dart:developer';

import 'package:admin_sabji/data/repository/vendor_repository.dart';
import 'package:admin_sabji/res/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class VendorController extends GetxController {
  RxList<dynamic> vendors = <dynamic>[].obs;
  RxBool isLoading = false.obs;

  final _api = VendorRepository();
  @override
  void onInit() {
    refreshData();
    super.onInit();
    getvendorData();
  }

  Future<void> refreshData() async {
    await getvendorData();
  }

  Future<void> getvendorData() async {
    isLoading.value = true;
    try {
      await _api.getVendorrep().then((value) {
        isLoading.value = false;
        vendors.value = value[AppConstants.result];
      }).onError((error, stackTrace) {
        isLoading.value = false;
        log(("we have got an error in vendor ${error.toString()}"));
        Utils.snackBar('Error', error.toString());
      });
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
