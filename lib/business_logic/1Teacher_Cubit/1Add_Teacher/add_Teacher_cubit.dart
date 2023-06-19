import 'package:bloc/bloc.dart';
import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../shared/components/constants.dart';

part 'add_Teacher_state.dart';

class AddTeacherCubit extends Cubit<AddTeacherState> {
  AddTeacherCubit() : super(AddTeacherInitial());

  Color color = const Color(0xffAC3931);
  addTeacher(TeacherModel Teacher) async {
    emit(AddTeacherLoading());
    try {
      var LessonBox = Hive.box<TeacherModel>(kTeacherBox);
      await LessonBox.add(Teacher);
      emit(AddTeacherSuccess());
    } catch (e) {
      emit(AddTeacherFailure(e.toString()));
    }
  }
}
