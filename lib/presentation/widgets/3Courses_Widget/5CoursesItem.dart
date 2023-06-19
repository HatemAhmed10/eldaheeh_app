import 'package:eldaheeh/business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/models/2Course_Model/CourseModel.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/5Course_Details/Course_Details_View.dart';

class CoursesItem extends StatelessWidget {
  const CoursesItem(
      {Key? key,
      required this.Courses,
      required this.Techerindex,
      required this.teacherModel})
      : super(key: key);

  final CourseModel Courses;
  final int Techerindex;
  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CourseDetailsView(
              Courses: Courses,
              teacherModel: teacherModel,
            );
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: kPrimaryColor,
              width: 2,
            )),
        padding: const EdgeInsets.only(left: 5, right: 0, top: 24, bottom: 24),
        child: ListTile(
          leading: IconButton(
            onPressed: () {
              Courses.delete();
              BlocProvider.of<CourseCubit>(context)
                  .fetchAllCourses(TeacherID: teacherModel.teacherID);
            },
            icon: const Icon(
              Icons.delete,
              color: kBlackColor,
              size: 30,
            ),
          ),
          title: Text(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            Courses.CourseName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          subtitle: Text(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            "عدد الطلاب : ${Courses.studentList.length.toString()}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: kBlackColor,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
