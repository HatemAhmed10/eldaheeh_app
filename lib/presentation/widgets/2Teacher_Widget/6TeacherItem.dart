import 'dart:math';

import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/material.dart';
import '../../screens/3Courses_Screen/Courses_View.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem(
      {Key? key, required this.Teacher, required this.Techerindex})
      : super(key: key);

  final TeacherModel Teacher;
  final int Techerindex;
  final double containerHeight = 200;
  final double profileHeight = 50;

  @override
  Widget build(BuildContext context) {
    final bottom = containerHeight - profileHeight;

    final random = Random();
    final randomNumber = random.nextInt(imagePaths.length);
    final randomImage = AssetImage(imagePaths[randomNumber]);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CoursesView(
              teacher: Teacher,
              Techerindex: Techerindex,
            );
          }),
        );
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 50),
                child: Container(
                  width: double.infinity,
                  height: containerHeight,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2,
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          Teacher.teacherName,
                          style: const TextStyle(
                              color: kBlackColor,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            //${Teacher.courseName}
                            "إسم المادة : ${Teacher.courseName}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "عدد الطلاب : ${Teacher.studentList.length.toString()}",
                            style: const TextStyle(
                              color: kBlackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: bottom - 2,
                child: CircleAvatar(
                  radius: profileHeight + 2,
                  backgroundColor: kPrimaryColor,
                ),
              ),
              Positioned(
                bottom: bottom,
                child: CircleAvatar(
                  radius: profileHeight,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: randomImage,
                ),
              ),
              const Positioned(
                  right: 20,
                  top: 138,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kBlackColor,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
