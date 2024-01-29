import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class VendorRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> getVendorrep() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(AppUrl.findvendors, token);
    return response;
  }
}
