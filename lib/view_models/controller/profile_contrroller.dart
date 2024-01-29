import 'dart:developer';

import 'package:get/get.dart';

import '../../data/repository/profile_repository.dart';
import '../../res/constants/app_constants.dart';
import '../../utils/utils.dart';

class ProfileController extends GetxController {
  RxList<dynamic> faces = <dynamic>[].obs;
  RxBool isLoading = false.obs;

  final _api = ProfileRepository();

  @override
  void onInit() {
    refreshData();
    super.onInit();
    getprofileData();
  }

  Future<void> refreshData() async {
    await getprofileData();
  }

  Future<void> getprofileData() async {
    isLoading.value = true;
    try {
      await _api.getProfileUrl().then((value) {
        isLoading.value = false;
        faces.value = value[AppConstants.result];
      }).onError((error, stackTrace) {
        isLoading.value = false;
        log(("we have got an error in profile ${error.toString()}"));
        Utils.snackBar('Error', error.toString());
      });
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
