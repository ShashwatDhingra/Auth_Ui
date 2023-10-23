import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.prefixIcon,
      required this.validator,
      this.isObscure = false,
      this.textInputType = TextInputType.name
      });

  // Variables
  final TextEditingController textController;
  final String hintText;
  final Icon prefixIcon;
  final String? Function(String?) validator;
  final bool isObscure;
  final TextInputType textInputType;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  late bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 12,
            color: Colors.grey.withOpacity(.1),
            offset: const Offset(0, 10))
      ], borderRadius: BorderRadius.circular(52)),
      child: TextFormField(
        keyboardType: widget.textInputType,
        obscureText: _passwordVisible,
        controller: widget.textController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: widget.isObscure ? GestureDetector(
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: Icon(_passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off, color: Colors.grey.withOpacity(.7))) : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
            prefixIcon: widget.prefixIcon,
            prefixIconColor: Colors.grey.withOpacity(.8),
            fillColor: Colors.white,
            filled: true,
            errorStyle: TextStyle(color: Colors.red.shade400),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        validator: widget.validator,
      ),
    );
  }
}
