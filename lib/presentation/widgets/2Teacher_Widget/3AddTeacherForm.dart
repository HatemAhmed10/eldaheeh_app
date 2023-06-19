import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/1Teacher_Cubit/1Add_Teacher/add_Teacher_cubit.dart';
import '../../../shared/components/1Tooles/1Custom_Button.dart';
import '../../../shared/components/1Tooles/3CustomTextField.dart';

import 'package:uuid/uuid.dart';

class AddTeachetForm extends StatefulWidget {
  const AddTeachetForm({super.key});

  @override
  State<AddTeachetForm> createState() => _AddTeachetFormState();
}

class _AddTeachetFormState extends State<AddTeachetForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? teacherName, courseName;
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
              teacherName = value;
            },
            hint: 'أدخل إسم المدرس',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              courseName = value;
            },
            hint: 'أدخل إسم المادة',
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddTeacherCubit, AddTeacherState>(
            builder: (context, state) {
              return CustomButtonF(
                isLoading: state is AddTeacherLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    BlocProvider.of<AddTeacherCubit>(context).addTeacher(
                      TeacherModel(
                          teacherName: teacherName.toString(),
                          teacherID: generateRandomId(),
                          studentList: [],
                          CourseIDList: [],
                          courseName: courseName.toString(),
                          ),
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

String generateRandomId() {
  var uuid = const Uuid();
  return uuid.v4();
}
