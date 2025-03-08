// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomRowRememberMe extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const CustomRowRememberMe({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
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
