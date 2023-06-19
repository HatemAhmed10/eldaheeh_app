import 'package:eldaheeh/business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import 'package:eldaheeh/models/2Course_Model/CourseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/1Teacher_Model/TeacherModel.dart';
import '5CoursesItem.dart';

class CoursesListView extends StatelessWidget {
  CoursesListView({Key? key, required this.teacherModel}) : super(key: key);

  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        List<CourseModel> Coursess =
            BlocProvider.of<CourseCubit>(context).Courses!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Coursess.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: CoursesItem(
                    Courses: Coursess[index],
                    Techerindex: index,
                    teacherModel: teacherModel,
                  ),
                );
              }),
        );
      },
    );
  }
}
