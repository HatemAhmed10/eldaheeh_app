import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import '../../widgets/3Courses_Widget/1Courses_BottomSheetBody.dart';
import '../../widgets/3Courses_Widget/3CoursesViewsBody.dart';
import '../4Student_Screen/Student_View.dart';

class CoursesView extends StatefulWidget {
  const CoursesView(
      {Key? key, required this.teacher, required this.Techerindex})
      : super(key: key);

  final TeacherModel teacher;
  final int Techerindex;

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              context: context,
              builder: (context) {
                return Courses_BottomSheetBody_screen(
                  teacherModel: widget.teacher,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Courses"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CourseCubit>(context).fetchAllCourses(
                  TeacherID: widget.teacher.teacherID);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return StudentView(
                    teacher: widget.teacher,
                    Techerindex: widget.Techerindex,
                  );
                }),
              );
            },
            icon: const Icon(Icons.people),
          )
        ],
      ),
      body: CoursesViewsBody(teacherModel: widget.teacher),
    );
  }
}
