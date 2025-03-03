// ignore_for_file: sized_box_for_whitespace
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/plus_button.dart';
import 'package:osscam_app2/features/create_project_feature/ui/create_project_page.dart';

class CreateAndJoinPage extends StatelessWidget {
  const CreateAndJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Container(
              width: 413,
              height: 335,
              child: Image.asset("assets/image/osscamtraingle.png"),
            ),
            SizedBox(height: 32),
            CustomElevatedButton(
              title: "Create",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateProjectPage()),
                );
              },
            ),
            SizedBox(height: 32),
            Container(
              width: 283,
              height: 60,
              child: DottedBorder(
                dashPattern: [8, 6],
                borderType: BorderType.RRect,
                radius: Radius.circular(15),
                strokeWidth: 1.5,
                color: GREY,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPlusButton(),
                        SizedBox(width: 32),
                        Text(
                          'Join',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
