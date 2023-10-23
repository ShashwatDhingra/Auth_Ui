import 'package:auth_ui/utils/routes/routes_name.dart';
import 'package:auth_ui/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashServices{
  Future<bool> getUser() => UserViewModel().getUser();

  void authenticateUser(BuildContext context) async{
    getUser().then((value) async{
      if(!value)
      {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (route) => false);
      }
      else{
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(context, RouteName.home, (route) => false, arguments: '');
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error);
      }
    });
  }
}