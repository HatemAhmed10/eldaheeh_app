import 'package:eldaheeh/business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import 'package:eldaheeh/business_logic/3Course_Details_Cubit/CourseDetail_cubit.dart';
import 'package:eldaheeh/models/1Teacher_Model/TeacherModel.dart';
import 'package:eldaheeh/models/2Course_Model/CourseModel.dart';
import 'package:eldaheeh/presentation/screens/1Splash_Screen/splash_view.dart';
import 'package:eldaheeh/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'business_logic/1Teacher_Cubit/2Get_Teacher/get_Teacher_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Bloc.observer = SimpleBlocObserver();

  // await Hive.close();

  Hive.registerAdapter(TeacherModelAdapter());
  await Hive.openBox<TeacherModel>(kTeacherBox);

  Hive.registerAdapter(CourseModelAdapter());
  await Hive.openBox<CourseModel>(kCourseBox);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return TeachersCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return CourseCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return CourseDetailsCubit();
          },
        ),
      ],
      // create: (context) => TeachersCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}