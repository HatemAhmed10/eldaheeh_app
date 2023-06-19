import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/4Student_Widget/1Student_BottomSheetBody.dart';
import '../../widgets/4Student_Widget/3StudentViewsBody.dart';

class StudentView extends StatelessWidget {
  StudentView({Key? key, required this.teacher, required this.Techerindex})
      : super(key: key);

  final TeacherModel teacher;
  int Techerindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              context: context,
              builder: (context) {
                return Student_BottomSheetBody_screen(
                  teacher: teacher,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("People"),
      ),
      body: StudentViewsBody(teacher: teacher, Techerindex: Techerindex),
    );
  }
}
