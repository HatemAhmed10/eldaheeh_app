part of 'CourseDetail_cubit.dart';

@immutable
abstract class CourseDetailsState {}

class CourseDetailsInitial extends CourseDetailsState {}

class AddStudentToRegisterSuccess extends CourseDetailsState {}

class GetStudentInfoSuccess extends CourseDetailsState {}

class CalculateMoenySuccess extends CourseDetailsState {}

class ChangeNumberOfPayToStudentSuccess extends CourseDetailsState {}
