import 'package:auth_ui/utils/routes/routes_generator.dart';
import 'package:auth_ui/utils/routes/routes_name.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:auth_ui/view_model/auth_view_model.dart';
import 'package:auth_ui/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserViewModel()),
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
    )
  ], child: const MyApp()));
  Utils.initialConfiguration();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme(bodyLarge: GoogleFonts.lato())),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteName.splash,
    );
  }
}
