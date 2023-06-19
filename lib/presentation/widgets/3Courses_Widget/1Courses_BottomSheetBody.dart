import 'package:eldaheeh/business_logic/2Courses_Cubit/1Add_Courses/add_Courses_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '2AddCoursesForm.dart';

class Courses_BottomSheetBody_screen extends StatelessWidget {
  Courses_BottomSheetBody_screen({Key? key, required this.teacherModel})
      : super(key: key);

  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCoursesCubit(),
      child: BlocConsumer<AddCoursesCubit, AddCoursesState>(
        listener: (context, state) {
          // if (state is AddCoursesFailure) {
          //   print(state.errMessage);
          // }

          if (state is AddCoursesSuccess) {
            BlocProvider.of<CourseCubit>(context)
                .fetchAllCourses(TeacherID: teacherModel.teacherID);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddCoursesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16, 
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: AddCoursesForm(teacherModel: teacherModel),
              ),
            ),
          );
        },
      ),
    );
  }
}
