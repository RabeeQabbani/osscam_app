// ignore_for_file: sized_box_for_whitespace, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/bug_container.dart';
import 'package:osscam_app2/features/auth_feature/bloc/auth_bloc.dart';
import 'package:osscam_app2/features/auth_feature/ui/login_page.dart';
import 'package:osscam_app2/features/project_manger_feature/bloc/project_bloc.dart';
import 'package:osscam_app2/features/project_manger_feature/model/project_model.dart';
import 'package:osscam_app2/features/project_manger_feature/ui/create_and_join_page.dart';
import 'package:readmore/readmore.dart';

class ProjectCreatedSuccessfullyPage extends StatelessWidget {
  ProjectCreatedSuccessfullyPage({super.key, required this.projectModel});
  ProjectModel projectModel;
  final List<String> tasks = [
    "Implement Data Model",
    "Implement Search Functionality",
    "Implement Search Functionality",
    "Implement Data Model",
    "Implement Search Functionality",
    "Implement Search Functionality",
    "Implement Data Model",
    "Implement Search Functionality",
    "Implement Search Functionality",
    "Implement Search Functionality",
    "Implement Search Functionality",
    "Implement Search Functionality",
    "Implement Search Functionality",
  ];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: BLUE,
      drawer: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Logout success"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else if (state is FailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Drawer(
              backgroundColor: BLUE,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      child: Image.asset("assets/image/yeti.png"),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "User Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: GREY,
                      ),
                    ),
                    SizedBox(height: 48),
                    Divider(),
                    SizedBox(height: 16),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAndJoinPage(),
                          ),
                        );
                      },
                      leading: Image.asset(
                        "assets/image/link 1.png",
                        color: GREY,
                      ),
                      title: Text(
                        "Create & Join",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: GREY,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.translate, color: GREY),
                      title: Text(
                        "Change language",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: GREY,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(
                          context,
                        ).add(LogoutEvent());
                      },
                      leading: Icon(Icons.logout, color: GREY),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: GREY,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    Divider(),
                  ],
                ),
              ),
            );
          }
        },
      ),
      body: Center(
        child: BlocConsumer<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is DeleteProjectSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Delete Project success"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateAndJoinPage()),
              );
            } else if (state is ProjectError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProjectLoading) {
              return CupertinoActivityIndicator();
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Center(
                      child: Container(
                        width: 342,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: GREEN,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                icon: Icon(Icons.menu),
                              ),
                              Text(
                                projectModel.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              PopupMenuButton(
                                onSelected: (value) {},
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => Center(
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      width: 272,
                                                      height: 199,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color: RED,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      child: Container(
                                                        width: 239,
                                                        height: 149,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                          color: GREY,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                left: 8.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  8.0,
                                                                ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Are you sure you want to delete this project ?",
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets.only(
                                                                        bottom:
                                                                            16.0,
                                                                      ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap: () {
                                                                          BlocProvider.of<
                                                                            ProjectBloc
                                                                          >(
                                                                            context,
                                                                          ).add(
                                                                            DeleteProjectEvent(
                                                                              projectId:
                                                                                  projectModel.id,
                                                                            ),
                                                                          );
                                                                        },
                                                                        child: Container(
                                                                          width:
                                                                              86,
                                                                          height:
                                                                              32,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                              5,
                                                                            ),
                                                                            color: Color.fromARGB(
                                                                              255,
                                                                              153,
                                                                              153,
                                                                              153,
                                                                            ),
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              "Yes, i sure",
                                                                              style: TextStyle(
                                                                                fontSize:
                                                                                    16,
                                                                                fontWeight:
                                                                                    FontWeight.w400,
                                                                                color:
                                                                                    Colors.white,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () {
                                                                          Navigator.pop(
                                                                            context,
                                                                          );
                                                                        },
                                                                        child: Text(
                                                                          "Cancel",
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                      },
                                      value: "option1",
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.delete),
                                              Text("    Delete"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: "option2",
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit_square),
                                          Text("    Update"),
                                        ],
                                      ),
                                    ),
                                  ];
                                },
                                icon: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: BLUE,
                                      ),
                                      SizedBox(width: 1),
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: BLUE,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    width: 316,
                    decoration: BoxDecoration(
                      color: YELLOW,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        projectModel.description,
                        trimLines: 10,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: "..... Read more",
                        //trimExpandedText: "Show less",
                        moreStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          color: GREEN,
                        ),
                        // lessStyle: TextStyle(
                        //   fontSize: 15,
                        //   fontWeight: FontWeight.w400,
                        //   decoration: TextDecoration.underline,
                        //   color: GREEN,
                        // ),
                        style: TextStyle(
                          color: BLUE,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomBug(
                                status: "Baking",
                                taskName: tasks[1],
                                color: PURPLE,
                              ),
                              CustomBug(
                                status: "Baking",
                                taskName: tasks[1],
                                color: PURPLE,
                              ),
                              CustomBug(
                                status: "Baking",
                                taskName: tasks[1],
                                color: PURPLE,
                              ),
                              CustomBug(
                                status: "Baking",
                                taskName: tasks[1],
                                color: PURPLE,
                              ),
                              CustomBug(
                                status: "Baking",
                                taskName: tasks[1],
                                color: PURPLE,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomBug(
                                  status: "on progress..",
                                  taskName: tasks[1],
                                  color: RED,
                                ),
                                CustomBug(
                                  status: "on progress..",
                                  taskName: tasks[1],
                                  color: RED,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomBug(
                                status: "Done",
                                taskName: tasks[1],
                                color: GREEN2,
                              ),
                              CustomBug(
                                status: "Done",
                                taskName: tasks[1],
                                color: GREEN2,
                              ),
                              CustomBug(
                                status: "Done",
                                taskName: tasks[1],
                                color: GREEN2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            ///////////////////////////////////////
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        backgroundColor: GREEN,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/image/fab_background.png"),
        ),
      ),
    );
  }
}
