import 'package:auth_ui/view_model/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices service = SplashServices();

  @override
  void initState() {
    super.initState();
    service.authenticateUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        ColorizeAnimatedText(
            colors: [
              Colors.pink,
              Colors.deepPurple.shade400,
              Colors.deepPurple,
              Colors.red.shade300,
              Colors.white
            ],
            'First Thing',
            textStyle:
                const TextStyle(fontSize: 62, fontWeight: FontWeight.bold),
            speed: const Duration(milliseconds: 500))
      ],
    )));
  }
}
