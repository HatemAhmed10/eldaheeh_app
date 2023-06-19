import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/constants.dart';

part 'get_Teacher_state.dart';

class TeachersCubit extends Cubit<TeachersState> {
  TeachersCubit() : super(TeachersInitial());

  List<TeacherModel>? Teachers;
  fetchAllTeachers() {
    var LessonBox = Hive.box<TeacherModel>(kTeacherBox);

    Teachers = LessonBox.values.toList();

    emit(TeachersSuccess());
  }
}
