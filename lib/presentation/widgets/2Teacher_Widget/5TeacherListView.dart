import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';
import '6TeacherItem.dart';

class TeacherListView extends StatelessWidget {
  const TeacherListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, TeachersState>(
      builder: (context, state) {
        List<TeacherModel> teachers =
            BlocProvider.of<TeachersCubit>(context).Teachers!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemCount: teachers.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TeacherItem(
                    Teacher: teachers[index],
                    Techerindex: index,
                  ),
                );
              }),
        );
      },
    );
  }
}
