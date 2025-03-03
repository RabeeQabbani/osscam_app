import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomRowRememberMe extends StatelessWidget {
  const CustomRowRememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text(
          "Remember me",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: BLUE,
          ),
        ),
      ],
    );
  }
}