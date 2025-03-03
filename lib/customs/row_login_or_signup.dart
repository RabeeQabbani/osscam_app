import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomRowLognOrSignup extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomRowLognOrSignup({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ?", style: TextStyle(color: GREY)),
        TextButton(
          onPressed: onPressed,
          child: Text(" $title", style: TextStyle(color: GREEN)),
        ),
      ],
    );
  }
}