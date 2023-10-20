import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(249, 119, 148, 1), Color.fromRGBO(98, 58, 162, 1)], begin: Alignment(-0.7, -1.7)),
            borderRadius: BorderRadius.circular(24)),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
