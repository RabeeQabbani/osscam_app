// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/appbar.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/features/create_project_feature/model/project_model.dart';

class CreateProjectPage extends StatelessWidget {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectScriptController = TextEditingController();

  CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      appBar: CustomAppBar(title: "Create Project"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "  Project Name",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: GREY,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 310,
              height: 60,
              child: TextField(
                controller: projectNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: PURPLE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: PURPLE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "  Project Script",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: GREY,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 316,
              child: TextField(
                maxLines: 16,
                controller: projectScriptController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: PURPLE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: PURPLE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CustomElevatedButton(
                title: "Create",
                onPressed: () {
                  ProjectModel(
                    projectName: projectNameController.text,
                    projectDescription: projectScriptController.text,
                    projectStatus: "new",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
