// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: YELLOW,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: BLUE,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
