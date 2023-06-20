import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import '../../../business_logic/3Course_Details_Cubit/CourseDetail_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../models/2Course_Model/CourseModel.dart';
import '../../widgets/5CourseDetails_Widget/1CourseDetailsViewbody.dart';
import '1ChosseStudent/chosseStudent.dart';

class CourseDetailsView extends StatelessWidget {
  CourseDetailsView(
      {Key? key, required this.Courses, required this.teacherModel})
      : super(key: key);

  final CourseModel Courses;
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          BlocProvider.of<CourseDetailsCubit>(context)
              .AddStudentToRegister(StudentName: "", courseModel: Courses);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ChooseStudent(
                Courses: Courses,
                teacherModel: teacherModel,
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("one group students"),
      ),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          BlocProvider.of<CourseCubit>(context)
              .fetchAllCourses(TeacherID: teacherModel.teacherID);
          BlocProvider.of<CourseDetailsCubit>(context)
              .CalculateMoeny(courseModel: Courses);

          return CourseDetailsViewbody(
            Courses: Courses,
            teacherModel: teacherModel,
          );
        },
      ),
    );
  }
}
