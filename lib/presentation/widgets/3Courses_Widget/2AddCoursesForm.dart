import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/models/2Course_Model/CourseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/2Courses_Cubit/1Add_Courses/add_Courses_cubit.dart';
import '../../../shared/components/1Tooles/1Custom_Button.dart';
import '../../../shared/components/1Tooles/3CustomTextField.dart';

class AddCoursesForm extends StatefulWidget {
  const AddCoursesForm({Key? key, required this.teacherModel})
      : super(key: key);

  final TeacherModel teacherModel;
  @override
  State<AddCoursesForm> createState() => _AddCoursesFormState();
}

class _AddCoursesFormState extends State<AddCoursesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? CoursesName, CoursesPrice, TeacherRate, officeRate;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              CoursesName = value;
            },
            hint: 'أدخل إسم المجموعة',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              CoursesPrice = value;
            },
            hint: 'أدخل سعر الحصة',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              officeRate = value;
            },
            hint: 'أدخل نسبة السنتر',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              TeacherRate = value;
            },
            hint: 'أدخل نسبة المدرس',
          ),
          SizedBox(height: 20,),
          BlocBuilder<AddCoursesCubit, AddCoursesState>(
            builder: (context, state) {
              return CustomButtonF(
                isLoading: state is AddCoursesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    BlocProvider.of<AddCoursesCubit>(context).addCourses(
                      CourseModel(
                          studentList: [],
                          CourseName: CoursesName.toString(),
                          CourseID: "1",
                          CoursePrice: CoursesPrice.toString(),
                          officeRate: officeRate.toString(),
                          teacherRate: TeacherRate.toString(),
                          TeacherId: widget.teacherModel.teacherID,
                          studentInf: {}),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
