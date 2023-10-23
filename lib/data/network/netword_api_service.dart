import 'dart:convert';
import 'package:auth_ui/data/network/base_api_service.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      // responseJson = resolveResponse(response);
      return responseJson;
    } catch (e) {
      return Exception(e.toString());
    }
  }

  @override
  Future<dynamic> getPostApiResponse(
      String url,dynamic data) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      responseJson = resolveResponse(response);
      return responseJson;

      
    } catch (e) {
      return Exception(e.toString());
    }
  }

  dynamic resolveResponse(http.Response response) {
    switch (response.statusCode) {
      // Success
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      // Bad Request
      case 400:
        final message = jsonDecode(response.body)['error'];
        return {"success": false, "message": message};

      // Unauthorized
      case 401:
        final message = jsonDecode(response.body)['error'];
        return {"success": false, "message": message};

      // Not Found
      case 404:
        final message = jsonDecode(response.body)['error'];
        return {"success": false, "message": message};

      // Internal Server Error
      case 500:
        final message = jsonDecode(response.body)['error'];
        return {"success": false, "message": message};

      default:
        return {"success": false, "message": 'error'};
    }
  }
}
