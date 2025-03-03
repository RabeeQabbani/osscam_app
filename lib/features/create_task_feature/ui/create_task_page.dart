import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/appbar.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/plus_button.dart';
import 'package:osscam_app2/features/project_created_successfully_feature/ui/project_created_successfully_page.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({super.key});
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
      appBar: CustomAppBar(title: "Tasks"),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 234,
              height: 550,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder:
                          (context, index) => SizedBox(height: 16),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (contex) {},
                                icon: Icons.delete,
                                foregroundColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                backgroundColor: RED,
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: 234,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: PURPLE,
                                ),
                              ),
                              Positioned(
                                bottom: 4,
                                child: Container(
                                  width: 215,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      tasks[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: InkWell(onTap: () {}, child: CustomPlusButton()),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            title: "Create",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectCreatedSuccessfullyPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
