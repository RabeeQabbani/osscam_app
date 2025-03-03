// ignore_for_file: sized_box_for_whitespace, annotate_overrides

import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BLUE,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: GREY,
        ),
      ),
      leading: Container(
        width: 75,
        height: 54,
        child: Image.asset("assets/image/osscamtraingle.png"),
      ),
    );
  }
  
  
}
