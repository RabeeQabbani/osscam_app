// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  $title",
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
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: GREEN,
              focusColor: GREEN,
              border: OutlineInputBorder(
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
