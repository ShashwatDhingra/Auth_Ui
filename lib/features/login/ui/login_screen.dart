import 'package:auth_ui/reusables/widgets/my_button.dart';
import 'package:auth_ui/reusables/widgets/my_text_field.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Variables
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late TapGestureRecognizer _createButtonGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _createButtonGestureRecognizer = TapGestureRecognizer()..onTap = _onCreateButtonTap;
  }

  // Methods
  void _onCreateButtonTap()
  {
    HapticFeedback.vibrate();
    print("Next Page");
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
      children: [
        SvgPicture.asset('assets/images/top_design.svg'),
        Align(
            alignment: const Alignment(-1, 1),
            child: Image.asset('assets/images/bottom_design.png')),
        
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hello - Text
            Text('Hello', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 82, fontWeight: FontWeight.w500)),
        
            32.ph,
        
            // Sign In - Text
             Text('Sign in to your account', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),),
        
            32.ph,
        
            // Username - TextField
            MyTextField(textController: usernameController, hintText: 'Username', prefixIcon: Icon(Icons.person)),
        
          32.ph,
        
            // Password - TextField
            MyTextField(textController: passwordController, hintText: 'Password', prefixIcon: Icon(Icons.lock)),
        
            32.ph,
        
            // Forget your password - Text Button
            SizedBox(
              width: size.width,
              child: Text('Forget your password?', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16, color: Colors.grey.withOpacity(.6)), textAlign: TextAlign.end,)),
        
            48.ph,
        
            // Sign In Text + Button 
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Sign in', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 28, fontWeight: FontWeight.w700)),
                12.pw,
                MyButton(onPressed: (){}),
              ],
            ),
        
            100.ph,

            // Dont have an account - Text
            RichText(text: TextSpan(style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500), children: [TextSpan(text: 'Don\'t have an account? '), TextSpan(recognizer: _createButtonGestureRecognizer, text: 'Create', style:  Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black, fontSize: 16, decoration: TextDecoration.underline, fontWeight: FontWeight.w500))]))
          ],),
        )
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    _createButtonGestureRecognizer.dispose();
  }
}
