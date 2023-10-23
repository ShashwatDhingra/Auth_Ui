import 'package:auth_ui/data/network/base_api_service.dart';
import 'package:auth_ui/data/network/netword_api_service.dart';
import 'package:auth_ui/res/app_url.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  BaseApiServices _baseApiServices = NetworkApiService();

  Future<dynamic> loginUser(dynamic data, BuildContext context) async {
    try {
      dynamic response =
          await _baseApiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerUser(dynamic data, BuildContext context) {
    try {
      dynamic response =
          _baseApiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
