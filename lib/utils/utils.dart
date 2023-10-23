// Using Sized Box again n again, so for clean code used this extension
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
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

  static showToastMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
            margin: EdgeInsets.all(8),
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.BOTTOM,
            titleSize: 12,
            titleColor: Colors.white,
            message: message,
            icon: const Icon(Icons.info_outline, color: Colors.white,),
            borderRadius: BorderRadius.circular(56),
            backgroundGradient: const LinearGradient(colors: [
              Color.fromRGBO(249, 119, 148, 1),
              Color.fromRGBO(98, 58, 162, 1)
            ], begin: Alignment(-0.7, -1.7)))
          ..show(context));
    // Fluttertoast.showToast(msg: message, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
  }
}
