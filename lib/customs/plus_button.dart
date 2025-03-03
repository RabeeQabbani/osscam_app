// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomPlusButton extends StatelessWidget {
  const CustomPlusButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: CircleAvatar(
        backgroundColor: YELLOW,
        child: Icon(Icons.add, color: BLUE),
      ),
    );
  }
}