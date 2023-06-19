import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';
import '../../../shared/components/1Tooles/1Custom_Button.dart';
import '../../../shared/components/1Tooles/3CustomTextField.dart';

class AddStudentForm extends StatefulWidget {
  const AddStudentForm({Key? key, required this.teacher}) : super(key: key);

  final TeacherModel teacher;
  @override
  State<AddStudentForm> createState() => _AddStudentFormState();
}

class _AddStudentFormState extends State<AddStudentForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? StudentName;
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
              StudentName = value;
            },
            hint: 'أدخل إسم الطالب',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButtonF(
            // isLoading: state is AddTeacherLoading ? true : false,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                List Students = widget.teacher.studentList;
                Students.add(StudentName.toString());
                widget.teacher.studentList = Students;
                widget.teacher.save();
                BlocProvider.of<TeachersCubit>(context).fetchAllTeachers();
                Navigator.pop(context);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
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
