import 'package:eldaheeh/shared/components/constants.dart';
import 'package:eldaheeh/shared/styles/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/3Course_Details_Cubit/CourseDetail_cubit.dart';
import '../../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../../models/2Course_Model/CourseModel.dart';
import '../../../widgets/5CourseDetails_Widget/3CustomAddStudentButton.dart';

class ChooseStudent extends StatelessWidget {
  ChooseStudent({Key? key, required this.Courses, required this.teacherModel})
      : super(key: key);

  final CourseModel Courses;
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Choose Students"),
      ),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          List StudentRegister =
              BlocProvider.of<CourseDetailsCubit>(context).RegisterStudent;
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Image(
                image: AssetImage(
                  ImageAssets.logo,
                ),
                width: 150,
              ),
              Container(
                height: 380,
                color: kWhiteColor,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: teacherModel.studentList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<CourseDetailsCubit>(context)
                                .AddStudentToRegister(
                                    StudentName: teacherModel.studentList[index]
                                        .toString(),
                                    courseModel: Courses);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: StudentRegister.contains(
                                        teacherModel.studentList[index])
                                    ? kPrimaryColor
                                    : kWhiteColor,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: StudentRegister.contains(
                                          teacherModel.studentList[index])
                                      ? kBlackColor
                                      : kPrimaryColor,
                                  width: 2,
                                )),
                            padding: const EdgeInsets.only(
                                left: 16, top: 8, bottom: 8),
                            child: ListTile(
                              title: Text(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                teacherModel.studentList[index].toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor,
                                ),
                              ),
                              leading:const Icon(
                                Icons.delete,
                                color: kBlackColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              CustomAddStudentButton(
                lengthStudent: StudentRegister.length,
                onTap: () {
                  BlocProvider.of<CourseDetailsCubit>(context)
                      .GetStudentInfo(courseModel: Courses);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
