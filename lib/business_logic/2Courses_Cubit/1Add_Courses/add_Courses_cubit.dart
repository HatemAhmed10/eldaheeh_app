import 'package:bloc/bloc.dart';
import 'package:eldaheeh/models/2Course_Model/CourseModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../shared/components/constants.dart';

part 'add_Courses_state.dart';

class AddCoursesCubit extends Cubit<AddCoursesState> {
  AddCoursesCubit() : super(AddCoursesInitial());

  Color color = const Color(0xffAC3931);
  addCourses(CourseModel Courses) async {
    emit(AddCoursesLoading());
    try {
      var CoursesBox = Hive.box<CourseModel>(kCourseBox);
      await CoursesBox.add(Courses);
      print("Goood Add");
      emit(AddCoursesSuccess());
    } catch (e) {
      emit(AddCoursesFailure(e.toString()));
    }
  }
}
