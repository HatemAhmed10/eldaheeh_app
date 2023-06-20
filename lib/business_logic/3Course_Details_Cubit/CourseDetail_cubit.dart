import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../models/2Course_Model/CourseModel.dart';
part 'CourseDetails_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit() : super(CourseDetailsInitial());

  List RegisterStudent = [];

  void AddStudentToRegister(
      {required String StudentName, required CourseModel courseModel}) {
    RegisterStudent = courseModel.studentList;
    if (StudentName == "") {
    } else {
      if (RegisterStudent.contains(StudentName)) {
        RegisterStudent.remove(StudentName.toString());
      } else {
        RegisterStudent.add(StudentName);
      }
    }
    emit(AddStudentToRegisterSuccess());
  }

  Map<String, int> StudentInformation = {};
  void GetStudentInfo({required CourseModel courseModel}) {
    StudentInformation.clear();
    if (courseModel.studentInf.length == 0) {
      print("11111111111111");
      courseModel.studentList.forEach((element) {
        courseModel.studentInf.addAll({element: 0});
        // courseModel.studentInf = StudentInformation;
        courseModel.save();
      });
    } else if (courseModel.studentList.length > courseModel.studentInf.length) {
      print("222222222");

      for (int x = courseModel.studentInf.length;
          x < courseModel.studentList.length;
          x++) {
        courseModel.studentInf.addAll({courseModel.studentList[x]: 0});
        courseModel.save();
      }
    } else if (courseModel.studentList.length < courseModel.studentInf.length) {
      print("333333333333333");

      courseModel.studentInf.forEach((key, value) {
        if (courseModel.studentList.contains(key)) {
          StudentInformation.addAll({key: value});
        } else {
          print("no" + value.toString());
        }
      });
      courseModel.studentInf = StudentInformation;
      courseModel.save();
    }

    emit(GetStudentInfoSuccess());
  }

  double ReasultOFPayStudent = 0;
  double ReasultOfOfficeRate = 0;
  double ReasultOfTeacherRate = 0;
  void CalculateMoeny({required CourseModel courseModel}) {
    double NumberOfStudentpay = 0;
    courseModel.studentInf.forEach((key, value) {
      NumberOfStudentpay = NumberOfStudentpay + value;
    });
    ReasultOFPayStudent =
        NumberOfStudentpay * int.parse(courseModel.CoursePrice);

    ReasultOfOfficeRate =
        ((int.parse(courseModel.officeRate) * ReasultOFPayStudent) / 100);

    ReasultOfTeacherRate =
        ((int.parse(courseModel.teacherRate) * ReasultOFPayStudent) / 100);

    emit(CalculateMoenySuccess());
  }

  Map<String, int> FinalStudentInformation = {};
  void ChangeNumberOfPayToStudent(
      {required List Keys,
      required List Values,
      required CourseModel courseModel}) {
    for (int x = 0; x < Values.length; x++) {
      FinalStudentInformation.addAll({Keys[x].toString(): Values[x]});
    }
    courseModel.studentInf = FinalStudentInformation;
    courseModel.save();
    emit(ChangeNumberOfPayToStudentSuccess());
  }
}
