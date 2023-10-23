import 'package:auth_ui/repository/auth_repository.dart';
import 'package:auth_ui/utils/routes/routes_name.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  _setLoading(bool loadingState) {
    _loading = loadingState;
    notifyListeners();
  }

  Future<bool> loginUser(dynamic data, BuildContext context) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));

    _authRepo.loginUser(data, context).then((value) {
      if (value['success'] == false) {
        Utils.showToastMessage(context, value['message'], false);
        return false;
      } else if (value['success'] == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.home, (route) => false,
            arguments: 'Welcome Back');
        return true;
      }
      return false;
    }).onError((error, stackTrace) {
      Utils.showToastMessage(context, error.toString(), false);
      return false;
    });

    _setLoading(false);
    return false;
  }

  Future<void> registerUser(dynamic data, BuildContext context) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));

    _authRepo.registerUser(data, context).then((value) {
      if (value['success'] == false) {
        Utils.showToastMessage(context, value['message'], false);
      } else if (value['success'] == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.home, (route) => false,
            arguments: 'Welcome');
      }
    }).onError((error, stackTrace) {
      Utils.showToastMessage(context, error.toString(), false);
    });

    _setLoading(false);
  }
}
