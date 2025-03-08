// ignore_for_file: sized_box_for_whitespace, must_be_immutable
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/plus_button.dart';
import 'package:osscam_app2/features/project_manger_feature/bloc/project_bloc.dart';
import 'package:osscam_app2/features/project_manger_feature/model/project_model.dart';
import 'package:osscam_app2/features/project_manger_feature/ui/create_project_page.dart';
import 'package:osscam_app2/features/project_manger_feature/ui/project_created_successfully_page.dart';

class CreateAndJoinPage extends StatelessWidget {
  CreateAndJoinPage({super.key});

  TextEditingController projectIdController = TextEditingController();

  late ProjectModel projectModel;

  bool isProjectModelInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         try {
      //           AuthServicesImple(dio: Dio()).logout();
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => LoginPage()),
      //           );
      //         } catch (e) {
      //           throw NoTokenFound();
      //         }
      //       },
      //       icon: Icon(Icons.logout),
      //     ),
      //   ],
      // ),
      backgroundColor: BLUE,
      body: Center(
        child: BlocConsumer<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is ProjectError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is GetOneProjectSuccess) {
              projectModel = state.projectModel;
              // isProjectModelInitialized = true;
              // print(isProjectModelInitialized);
            } else if (state is JoinToProjectSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Join Project success"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ProjectCreatedSuccessfullyPage(
                        projectModel: projectModel,
                      ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProjectLoading) {
              return CircularProgressIndicator();
            } else {
              return Column(
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
                        MaterialPageRoute(
                          builder: (context) => CreateProjectPage(),
                        ),
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
                      ///////////////////////
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
                                          controller: projectIdController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 64),
                                      Container(
                                        width: 271,
                                        height: 49,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ////////////////////////////

                                            BlocProvider.of<ProjectBloc>(
                                              context,
                                            ).add(
                                              JoinToProject(
                                                projectId: int.parse(
                                                  projectIdController.text,
                                                ),
                                              ),
                                            );
                                            BlocProvider.of<ProjectBloc>(
                                              context,
                                            ).add(
                                              GetOneProjectEvent(
                                                projectId: int.parse(
                                                  projectIdController.text,
                                                ),
                                              ),
                                            );
                                            Navigator.pop(context);
                                            projectIdController.clear();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: BLUE,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 100,
                                              vertical: 15,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
              );
            }
          },
        ),
      ),
    );
  }
}
