import 'package:eldaheeh/business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import 'package:eldaheeh/business_logic/3Course_Details_Cubit/CourseDetail_cubit.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:eldaheeh/shared/styles/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '4CoursesListView.dart';

class CoursesViewsBody extends StatefulWidget {
  CoursesViewsBody({Key? key, required this.teacherModel}) : super(key: key);

  final TeacherModel teacherModel;
  @override
  State<CoursesViewsBody> createState() => _CoursesViewsBodyState();
}

class _CoursesViewsBodyState extends State<CoursesViewsBody> {
  @override
  void initState() {
    BlocProvider.of<CourseCubit>(context)
        .fetchAllCourses(TeacherID: widget.teacherModel.teacherID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
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
              const Spacer(),
              Text(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                "نسبة السنتر : ${BlocProvider.of<CourseDetailsCubit>(context).ReasultOfOfficeRate.toString()}",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                "نسبة المدرس : ${BlocProvider.of<CourseDetailsCubit>(context).ReasultOfTeacherRate.toString()}",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                "الإجمالي : ${BlocProvider.of<CourseDetailsCubit>(context).ReasultOFPayStudent.toString()}",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
          Expanded(
            child: CoursesListView(teacherModel: widget.teacherModel),
          ),
        ],
      ),
    );
  }
}
