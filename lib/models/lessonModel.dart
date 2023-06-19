import 'package:hive/hive.dart';

part 'lessonModel.g.dart';

@HiveType(typeId: 0)
class lessonModel extends HiveObject {
  @HiveField(0)
  String teacherName;
  @HiveField(1)
  String teacherID;
  @HiveField(2)
  List studentList;
  @HiveField(3)
  String lessonName;
  @HiveField(4)
  String lessonID;
  @HiveField(5)
  String lessonPrice;
  @HiveField(6)
  String officeRate;
  @HiveField(7)
  String teacherRate;
  @HiveField(8)
  String tomasrate;
  @HiveField(9)
  Map<String, List> studentInf;

  lessonModel({
    required this.teacherName,
    required this.teacherID,
    required this.studentList,
    required this.lessonName,
    required this.lessonID,
    required this.lessonPrice,
    required this.officeRate,
    required this.teacherRate,
    required this.tomasrate,
    required this.studentInf,
  });
}
