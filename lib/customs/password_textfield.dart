// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomPasswordTexField extends StatelessWidget {
  const CustomPasswordTexField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  Password",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: BLUE,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 226,
          height: 43,
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.visibility_off),
              filled: true,
              fillColor: GREEN,
              focusColor: GREEN,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: PURPLE),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: PURPLE),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
