import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.textController, required this.hintText, required this.prefixIcon});

  // Variables
  final TextEditingController textController;
  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(.17), offset: Offset(0, 7))], borderRadius: BorderRadius.circular(36)),
      child: TextField(
        decoration: InputDecoration(hintText: hintText, 
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.6)),
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.grey.withOpacity(.8),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)
        ),
      ),
    );
  }
}