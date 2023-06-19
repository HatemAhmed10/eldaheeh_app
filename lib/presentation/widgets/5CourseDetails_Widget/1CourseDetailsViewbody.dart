import 'package:eldaheeh/shared/components/constants.dart';
import 'package:eldaheeh/shared/styles/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/3Course_Details_Cubit/CourseDetail_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../models/2Course_Model/CourseModel.dart';

class CourseDetailsViewbody extends StatelessWidget {
  CourseDetailsViewbody(
      {Key? key, required this.Courses, required this.teacherModel})
      : super(key: key);

  final CourseModel Courses;
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Image(
          image: AssetImage(ImageAssets.logo),
          width: 150,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(),
            Text(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              "نسبة السنتر : ${BlocProvider.of<CourseDetailsCubit>(context).ReasultOfOfficeRate.toString()}",
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              "نسبة المدرس : ${BlocProvider.of<CourseDetailsCubit>(context).ReasultOfTeacherRate.toString()}",
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              "الإجمالي : ${BlocProvider.of<CourseDetailsCubit>(context).ReasultOFPayStudent.toString()}",
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
        Container(
          width: double.infinity,
          height: 430,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Courses.studentInf.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                List keys = Courses.studentInf.keys.toList();
                List values = Courses.studentInf.values.toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          "${keys[index].toString()} / ${values[index].toString()}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        // subtitle: Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 16),
                        //   child: Text(
                        //     textAlign: TextAlign.right,
                        //     textDirection: TextDirection.rtl,
                        //     "${values[index].toString()} / 8",
                        //     style: TextStyle(
                        //       fontSize: 18,
                        //       color: Colors.black.withOpacity(.4),
                        //     ),
                        //   ),
                        // ),
                        trailing: IconButton(
                          onPressed: () {
                            values[index] = values[index] + 1;
                            BlocProvider.of<CourseDetailsCubit>(context)
                                .ChangeNumberOfPayToStudent(
                                    courseModel: Courses,
                                    Keys: keys,
                                    Values: values);
                            BlocProvider.of<CourseDetailsCubit>(context)
                                .GetStudentInfo(courseModel: Courses);
                            BlocProvider.of<CourseDetailsCubit>(context)
                                .CalculateMoeny(courseModel: Courses);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        leading: IconButton(
                          onPressed: () {
                            // values[index] = values[index] + 1;
                            // BlocProvider.of<CourseDetailsCubit>(context)
                            //     .ChangeNumberOfPayToStudent(
                            //         courseModel: Courses,
                            //         Keys: keys,
                            //         Values: values);
                            // BlocProvider.of<CourseDetailsCubit>(context)
                            //     .GetStudentInfo(courseModel: Courses);
                            // BlocProvider.of<CourseDetailsCubit>(context)
                            //     .CalculateMoeny(courseModel: Courses);
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
