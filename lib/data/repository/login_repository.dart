import '../../res/constants/app_url.dart';
import '../network/network_api_services.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiService.postApiEncoded(data, AppUrl.loginUrl, "");
    print("##########################" + response.toString());
    return response;
  }
}
