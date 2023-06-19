import 'package:bloc/bloc.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../models/2Course_Model/CourseModel.dart';

part 'get_Courses_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  List<CourseModel>? Courses1 = [];
  List<CourseModel>? Courses = [];

  fetchAllCourses({required String TeacherID}) {
    Courses = [];
    Courses1 = [];
    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    Courses1 = LessonBox.values.toList();
    Courses1!.forEach((element) {
      if (element.TeacherId == TeacherID) {
        Courses!.add(element);
      }
    });
    emit(CourseSuccess());
  }
}