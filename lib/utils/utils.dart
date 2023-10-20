// Using Sized Box again n again, so for clean code used this extension
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension MySizedBox on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

class Utils {
  static void initialConfiguration() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
