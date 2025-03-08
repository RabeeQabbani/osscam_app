// ignore_for_file: sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomPasswordTexField extends StatefulWidget {
  CustomPasswordTexField({
    super.key,
    required this.passwordController,
    required this.isVisible,
  });

  final TextEditingController passwordController;
  bool isVisible;

  @override
  State<CustomPasswordTexField> createState() => _CustomPasswordTexFieldState();
}

class _CustomPasswordTexFieldState extends State<CustomPasswordTexField> {
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
            controller: widget.passwordController,
            obscureText: !widget.isVisible,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
                child:
                    widget.isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
              ),
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
