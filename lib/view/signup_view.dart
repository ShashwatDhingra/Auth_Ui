import 'package:auth_ui/res/components/my_button.dart';
import 'package:auth_ui/res/components/my_text_field.dart';
import 'package:auth_ui/utils/utils.dart';
import 'package:auth_ui/view_model/auth_view_model.dart';
import 'package:auth_ui/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // Variables
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                      Image.asset('assets/images/top_design2.png'),
                      Positioned(
                          bottom: 0,
                          child: Image.asset('assets/images/bottom_design2.png')),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Builder(builder: (context) {
                          return SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (size.height * .1).ph,
                                  // Create Account - Text
                                  Text('Create account',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700)),

                                  (size.height * .04).ph,

                                  // Username - TextField
                                  MyTextField(
                                    textController: usernameController,
                                    hintText: 'Username',
                                    prefixIcon: const Icon(Icons.person),
                                    validator: validateUsername,
                                  ),

                                  24.ph,

                                  // Password - TextField
                                  MyTextField(
                                      textController: passwordController,
                                      hintText: 'Password',
                                      prefixIcon: const Icon(Icons.lock),
                                      validator: validatePassword,
                                      isObscure: true),

                                  24.ph,

                                  // Repeat Password - TextField
                                  MyTextField(
                                      textController: repeatPasswordController,
                                      hintText: 'Repeat Password',
                                      prefixIcon: const Icon(Icons.lock),
                                      validator: validateRepeatPassword,
                                      isObscure: true),

                                  24.ph,

                                  // Email - TextField
                                  MyTextField(
                                    textController: emailController,
                                    hintText: 'E-mail',
                                    prefixIcon: const Icon(Icons.email),
                                    validator: validateEmail,
                                    textInputType: TextInputType.emailAddress,
                                  ),

                                  24.ph,

                                  // Mobile - TextField
                                  MyTextField(
                                    textController: mobileController,
                                    hintText: 'Mobile',
                                    prefixIcon: const Icon(Icons.phone_iphone),
                                    validator: validateMobile,
                                    textInputType: TextInputType.phone,
                                  ),

                                  (size.height * .05).ph,

                                  // Create + Button
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Create',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w700)),
                                      12.pw,
                                      Consumer2<AuthViewModel, UserViewModel>(
                                          builder: (context, authViewModel,
                                                  userViewModel, child) =>
                                              MyButton(onPressed: () {
                                                HapticFeedback.vibrate();
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  Map<String, String> data = {
                                                    "name": usernameController.text
                                                        .toString(),
                                                    "phone": mobileController.text
                                                        .toString(),
                                                    "email": emailController.text
                                                        .toString(),
                                                    'password': passwordController
                                                        .text
                                                        .toString()
                                                  };

                                                  authViewModel.registerUser(
                                                      data, context);
                                                  userViewModel.saveUser();
                                                }
                                              })),
                                    ],
                                  ),

                                  (size.height * .05).ph,

                                  // Or create account using social acc. - Text

                                  Text('Or create account using social media',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),

                                  24.ph,

                                  // Row with social icons
                                  GestureDetector(
                                      onTap: () {
                                        Utils.showToastMessage(
                                            context, 'Not available yet');
                                      },
                                      child: Image.asset(
                                          'assets/images/social_frame.png'))
                                ],
                              ),
                            ),
                          );
                        }),
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
                              color: Colors.grey.withOpacity(.7),
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
    repeatPasswordController.dispose();
    emailController.dispose();
    mobileController.dispose();
  }

  // Methods
  String? validateUsername(String? value) {
    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return 'Enter correct Username';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Password must be greater than 6';
    } else if (passwordController.text != repeatPasswordController.text) {
      return 'Password does\'nt match';
    } else {
      return null;
    }
  }

  String? validateRepeatPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Password must be greater than 6';
    } else if (passwordController.text != repeatPasswordController.text) {
      return 'Password does\'nt match';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
      return 'Please enter correct e-mail id.';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter your Mobile Number';
    } else if (RegExp(r'^[0-9]+$').hasMatch(value) && value.length != 10) {
      return 'Enter valid Mobile Number';
    } else {
      print(value.length);
      return null;
    }
  }
}
