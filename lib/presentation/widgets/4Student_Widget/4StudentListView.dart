import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';
import '5StudentItem.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({Key? key, required this.Techerindex})
      : super(key: key);

  final int Techerindex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, TeachersState>(
      builder: (context, state) {
        List<TeacherModel> teachers =
            BlocProvider.of<TeachersCubit>(context).Teachers!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              itemCount: teachers[Techerindex].studentList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: StudentItem(
                    teacher: teachers[Techerindex],
                    studentList: teachers[Techerindex].studentList,
                    Studentindex: index,
                    StudentName: teachers[Techerindex].studentList[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
