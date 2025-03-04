// ignore_for_file: sized_box_for_whitespace, must_be_immutable
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/plus_button.dart';
import 'package:osscam_app2/features/create_project_feature/ui/create_project_page.dart';
import 'package:osscam_app2/features/login_feature/service/login_service.dart';
import 'package:osscam_app2/features/login_feature/ui/login_page.dart';

class CreateAndJoinPage extends StatelessWidget {
  CreateAndJoinPage({super.key});
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              try {
                AuthServicesImple(dio: Dio()).logout();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } catch (e) {
                throw NoTokenFound();
              }
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
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
                  onTap:
                      () => showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: GREEN,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                            height: 360,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 48,
                                    right: 48,
                                    top: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Enter project's\nID..",
                                        style: TextStyle(
                                          color: BLUE,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Image.asset(
                                          "assets/image/tree.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  width: 271,
                                  height: 49,
                                  child: TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 64),
                                Container(
                                  width: 271,
                                  height: 49,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: BLUE,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 100,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      "confirm",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
