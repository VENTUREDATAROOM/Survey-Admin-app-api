import 'dart:developer';

import 'package:admin_sabji/data/repository/kishan_repository.dart';
import 'package:admin_sabji/data/repository/vendor_repository.dart';
import 'package:admin_sabji/res/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class KishaanController extends GetxController {
  RxList<dynamic> farmers = <dynamic>[].obs;
  RxBool isLoading = false.obs;

  final _api = KishaanRepository();
  @override
  void onInit() {
    refreshData();
    super.onInit();
    getFarmerData();
  }

  Future<void> refreshData() async {
    await getFarmerData();
  }

  Future<void> getFarmerData() async {
    isLoading.value = true;
    try {
      await _api.getKishanrep().then((value) {
        isLoading.value = false;
        farmers.value = value[AppConstants.result];
      }).onError((error, stackTrace) {
        isLoading.value = false;
        log(("we have got an error in farmers ${error.toString()}"));
        Utils.snackBar('Error', error.toString());
      });
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
