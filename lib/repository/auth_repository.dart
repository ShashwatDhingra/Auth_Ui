import 'package:auth_ui/data/network/base_api_service.dart';
import 'package:auth_ui/data/network/netword_api_service.dart';
import 'package:auth_ui/res/app_url.dart';

class AuthRepository {
  BaseApiServices _baseApiServices = NetworkApiService();

  Future<dynamic> loginUser(dynamic data) async {
    try {
      dynamic response =
          await _baseApiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerUser(dynamic data) {
    try {
      dynamic response =
          _baseApiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
