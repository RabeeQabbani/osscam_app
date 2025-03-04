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
    return InkWell(
      onTap:
          () => showDialog(
            context: context,
            builder:
                (context) => Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 266,
                        height: 343,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: PURPLE,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: 248,
                          height: 287,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ". Implement a favorites feature that allows users to mark books as favorites.\n\n. Enable users to view their list of favorite books and persist the data between sessions.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 16.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: 125,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromARGB(
                                                255,
                                                53,
                                                163,
                                                163,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Add bugs",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: 12),
                                                Icon(
                                                  Icons.bug_report_outlined,
                                                  color: Colors.white,
                                                ),
                                              ],
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
          ),
      child: Padding(
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
      ),
    );
  }
}
