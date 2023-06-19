import 'package:eldaheeh/shared/styles/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';
import '5TeacherListView.dart';

class TeacherViewsBody extends StatefulWidget {
  const TeacherViewsBody({super.key});

  @override
  State<TeacherViewsBody> createState() => _TeacherViewsBodyState();
}

class _TeacherViewsBodyState extends State<TeacherViewsBody> {
  @override
  void initState() {
    BlocProvider.of<TeachersCubit>(context).fetchAllTeachers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image(image: AssetImage(ImageAssets.logo), width: 150),
          Expanded(
            child: TeacherListView(),
          ),
        ],
      ),
    );
  }
}
