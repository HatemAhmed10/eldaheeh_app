import 'package:eldaheeh/business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/1Teacher_Cubit/1Add_Teacher/add_Teacher_cubit.dart';
import '3AddTeacherForm.dart';

class BottomSheetBody_screen extends StatelessWidget {
  const BottomSheetBody_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTeacherCubit(),
      child: BlocConsumer<AddTeacherCubit, AddTeacherState>(
        listener: (context, state) {
          if (state is AddTeacherFailure) {
            print(state.errMessage);
          }

          if (state is AddTeacherSuccess) {
            BlocProvider.of<TeachersCubit>(context).fetchAllTeachers();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddTeacherLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddTeachetForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
