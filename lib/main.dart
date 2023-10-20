import 'package:auth_ui/features/login/ui/login_screen.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
  Utils.initialConfiguration();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: TextTheme(bodyLarge: GoogleFonts.lato())),
      home:const LoginScreen());
  }
}
