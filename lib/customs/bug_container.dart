import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';

class CustomBug extends StatelessWidget {
  final String status;
  final String taskName;
  final Color color;

  const CustomBug({
    super.key,
    required this.status,
    required this.taskName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 100,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
          Positioned(
            bottom: 4,
            child: Container(
              width: 90,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 1,
            left: 3,
            child: Text(
              status,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: BLUE,
              ),
            ),
          ),
          Positioned(
            top: 2,
            left: 78,
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.bug_report_outlined, size: 15, color: BLUE),
            ),
          ),
        ],
      ),
    );
  }
}
