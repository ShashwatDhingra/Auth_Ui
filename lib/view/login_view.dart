import 'package:auth_ui/utils/routes/routes_name.dart';
import 'package:auth_ui/res/components/my_button.dart';
import 'package:auth_ui/res/components/my_text_field.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:auth_ui/view_model/auth_view_model.dart';
import 'package:auth_ui/view_model/user_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Variables
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late TapGestureRecognizer _createButtonGestureRecognizer;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _createButtonGestureRecognizer = TapGestureRecognizer()
      ..onTap = _onCreateButtonTap;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Stack(
                    children: [
                      Image.asset('assets/images/top_design.png'),
                      Align(
                          alignment: const Alignment(-1, 1),
                          child:
                              Image.asset('assets/images/bottom_design.png')),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              54.ph,

                              // Hello - Text
                              Text('Hello',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 64,
                                          fontWeight: FontWeight.w700)),

                              32.ph,

                              // Sign In - Text
                              Text(
                                'Sign in to your account',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                              ),

                              32.ph,

                              // Username - TextField
                              MyTextField(
                                  textController: usernameController,
                                  hintText: 'Username',
                                  validator: validateUsername,
                                  prefixIcon: const Icon(Icons.person),
                                  textInputType: TextInputType.emailAddress,
                                  ),

                              32.ph,

                              // Password - TextField
                              MyTextField(
                                  validator: validatePassword,
                                  textController: passwordController,
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock),
                                  isObscure: true),

                              32.ph,

                              // Forget your password - Text Button
                              SizedBox(
                                  width: size.width,
                                  child: GestureDetector(
                                    onTap: () {
                                      Fluttertoast.cancel();
                                      Utils.showToastMessage(context,
                                          'No Worries! Contact our support team ');
                                    },
                                    child: Text(
                                      'Forget your password?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              color:
                                                  Colors.grey.withOpacity(.6)),
                                      textAlign: TextAlign.end,
                                    ),
                                  )),

                              (size.height * .1).ph,

                              // Sign In Text + Button
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Sign in',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700)),
                                  12.pw,
                                  Consumer2<AuthViewModel, UserViewModel>(
                                    builder: (context, authViewModel, userViewModel, child) =>
                                        MyButton(onPressed: () {
                                      HapticFeedback.vibrate();
                                      if (formKey.currentState!.validate()) {
                                        Map<String, String> data = {
                                          'username': usernameController.text
                                              .toString(),
                                          'password':
                                              passwordController.text.toString()
                                        };
                                        authViewModel.loginUser(data, context);
                                        userViewModel.saveUser();
                                      }
                                    }),
                                  ),
                                ],
                              ),

                              (size.height * .13).ph,

                              // Dont have an account - Text
                              RichText(
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                      children: [
                                    const TextSpan(text: 'Don\'t have an account? '),
                                    TextSpan(
                                        recognizer:
                                            _createButtonGestureRecognizer,
                                        text: 'Create',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: Colors.black,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w400))
                                  ])),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Consumer<AuthViewModel>(
                  builder: (context, authViewModel, child) =>
                      authViewModel.loading
                          ? Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.grey.withOpacity(.5),
                              child: const Center(
                                  child: SpinKitFadingCircle(color: Colors.white)),
                            )
                          : Container()),
            ),
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

  void _onCreateButtonTap() {
    HapticFeedback.vibrate();
    Navigator.pushNamed(context, RouteName.signup);
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'This field can\'nt be empty';
    } 
    else if(value.length < 6){
      return 'Must be greater than 6 digit';
    }
    else {
      return null;
    }
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'This field can\'nt be null';
    } 
    else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
      return 'Enter correct E-mail id';
    }
    else {
      return null;
    }
  }
}
