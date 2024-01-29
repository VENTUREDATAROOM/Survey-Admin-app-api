import '../../res/constants/app_url.dart';
import '../network/network_api_services.dart';

class RegisterRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> registerApi(var data) async {
    dynamic response = _apiService.postApi(data, AppUrl.registerUrl, "");
    return response;
  }
}
