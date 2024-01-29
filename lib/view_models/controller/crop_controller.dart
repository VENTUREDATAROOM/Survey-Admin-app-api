import 'dart:developer';

import 'package:admin_sabji/data/repository/crop_repository.dart';
import 'package:admin_sabji/data/repository/driver_repository.dart';
import 'package:admin_sabji/res/constants/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class CropController extends GetxController {
  RxList<dynamic> crops = <dynamic>[].obs;
  RxBool isLoading = false.obs;

  final _api = CropRepository();
  @override
  void onInit() {
    refreshData();
    super.onInit();
    getCropsData();
  }

  Future<void> refreshData() async {
    await getCropsData();
  }

  Future<void> getCropsData() async {
    isLoading.value = true;
    try {
      await _api.getCroprep().then((value) {
        isLoading.value = false;
        crops.value = value[AppConstants.result];
      }).onError((error, stackTrace) {
        isLoading.value = false;
        log(("we have got an error in Crops ${error.toString()}"));
        Utils.snackBar('Error', error.toString());
      });
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
