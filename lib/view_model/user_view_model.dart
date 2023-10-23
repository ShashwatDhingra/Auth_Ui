import 'package:auth_ui/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier{

  Future<bool> saveUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    try {
      bool value = await sp.setBool('isUserAvailable', true);
      print(value);
      return value;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    bool? value = sp.getBool('isUserAvailable');

    if (value != null) {
        return value;
    } else {
      return false;
    }
  }

  void removeUser(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove('isUserAvailable');

    sp.clear();

    Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (route) => false);

  }
}
