import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/shared/styles/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '4StudentListView.dart';

class StudentViewsBody extends StatefulWidget {
  StudentViewsBody({Key? key, required this.teacher, required this.Techerindex})
      : super(key: key);

  TeacherModel teacher;
  int Techerindex;

  @override
  State<StudentViewsBody> createState() => _StudentViewsBodyState();
}

class _StudentViewsBodyState extends State<StudentViewsBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Image(image: AssetImage(ImageAssets.logo), width: 150),
          Expanded(
            child: StudentListView(Techerindex: widget.Techerindex),
          ),
        ],
      ),
    );
  }
}
