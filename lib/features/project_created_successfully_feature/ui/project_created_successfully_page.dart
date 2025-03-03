import 'package:flutter/material.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/bug_container.dart';
import 'package:readmore/readmore.dart';

class ProjectCreatedSuccessfullyPage extends StatelessWidget {
  ProjectCreatedSuccessfullyPage({super.key});
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
    return Scaffold(
      backgroundColor: BLUE,
      body: Column(
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
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                      Text(
                        "project name",
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
                              value: "option1",
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.delete),
                                      Text("  Delete"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: "option2",
                              child: Divider(thickness: 0.5),
                            ),
                            PopupMenuItem(
                              value: "option3",
                              child: Row(
                                children: [
                                  Icon(Icons.edit_square),
                                  Text("  Update"),
                                ],
                              ),
                            ),
                          ];
                        },
                        icon: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              CircleAvatar(radius: 6, backgroundColor: BLUE),
                              SizedBox(width: 1),
                              CircleAvatar(radius: 6, backgroundColor: BLUE),
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
            //height: 218,
            decoration: BoxDecoration(
              color: YELLOW,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                " Enterprise equipment management system\nThrough which information is stored All types of equipment available And all maintenance operations are with Possibility of issuing reports and statements\nPeriodic (such as reports on devices). Which must be formatted and replaced With new devices Through which information is stored All types of equipment available And all maintenance operations are with Possibility of issuing reports and statements Periodic (such as reports on devices). Which must be formatted and replaced With new devices.Through which information is stored All types of equipment available And all maintenance operations are with Possibility ",
                trimLines: 10,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: "... Read more",
                trimExpandedText: "Show less",
                moreStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: GREEN,
                ),
                lessStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: GREEN,
                ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: GREEN,
        child: Icon(Icons.today_outlined, color: BLUE),
      ),
    );
  }
}
