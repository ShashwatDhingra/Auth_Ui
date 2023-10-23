import 'package:auth_ui/utils/routes/routes_name.dart';
import 'package:auth_ui/view/home_view.dart';
import 'package:auth_ui/view/login_view.dart';
import 'package:auth_ui/view/signup_view.dart';
import 'package:auth_ui/view/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings setting){
      switch (setting.name) {

        case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

        case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginView());

        case RouteName.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());

        case RouteName.home:
        String message = setting.arguments as String;
        return MaterialPageRoute(builder: (_) =>  HomeView(message: message));

        default:
        return _errorRoute();
      }
  }

static Route<dynamic> _errorRoute(){
  return MaterialPageRoute(builder: (context) {
    return Scaffold(appBar: AppBar(title: const Text('Error')), body: const Center(child: Text('Error')),);
  });
}

}