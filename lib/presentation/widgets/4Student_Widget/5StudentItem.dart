import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';

class StudentItem extends StatelessWidget {
  const StudentItem(
      {Key? key,
      required this.StudentName,
      required this.studentList,
      required this.Studentindex,
      required this.teacher})
      : super(key: key);

  final String StudentName;
  final List studentList;
  final int Studentindex;
  final TeacherModel teacher;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border.all(
            color: kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                StudentName.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor
                ),
              ),
              // subtitle: Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16),
              //   child: Text(
              //     teacher.toString(),
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.black.withOpacity(.4),
              //     ),
              //   ),
              // ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: kBlackColor,
              ),
              leading: IconButton(
                onPressed: () {
                  // print(lesson.toString());
                  studentList.removeAt(Studentindex);
                  teacher.studentList = studentList;
                  teacher.save();

                  BlocProvider.of<TeachersCubit>(context).fetchAllTeachers();
                },
                icon: const Icon(
                  Icons.delete,
                  color: kBlackColor,
                  size: 30,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Text(
            //     StudentName,
            //     style: TextStyle(
            //       color: Colors.black.withOpacity(.4),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
