import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class DashboardDetailsRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getFarmerRecordsCountApi(String userId) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(
        AppUrl.getFarmerRecordsCount + userId.toString(), token);
    return response;
  }

  Future<dynamic> getVendorRecordsCountApi(String userId) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(
        AppUrl.getVendorRecordsCount + userId.toString(), token);
    return response;
  }

  Future<dynamic> getCropRecordsCountApi(String userId) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(
        AppUrl.getCropRecordsCount + userId.toString(), token);
    return response;
  }

  Future<dynamic> getDriverRecordsCountApi(String userId) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(
        AppUrl.getDriverRecordsCount + userId.toString(), token);
    return response;
  }
}
