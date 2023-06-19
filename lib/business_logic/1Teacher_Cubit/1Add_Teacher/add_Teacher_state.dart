part of 'add_Teacher_cubit.dart';

@immutable
abstract class AddTeacherState {}

class AddTeacherInitial extends AddTeacherState {}

class AddTeacherLoading extends AddTeacherState {}

class AddTeacherSuccess extends AddTeacherState {}

class AddTeacherFailure extends AddTeacherState {
  final String errMessage;

  AddTeacherFailure(this.errMessage);
}
