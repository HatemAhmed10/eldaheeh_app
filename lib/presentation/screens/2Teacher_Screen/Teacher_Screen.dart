import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../shared/components/constants.dart';
import '../../widgets/2Teacher_Widget/1BottomSheetBody_screen.dart';
import '../../widgets/2Teacher_Widget/2TeacherViewsBody.dart';

class Teacher_Screen extends StatefulWidget {
  const Teacher_Screen({Key? key}) : super(key: key);

  @override
  State<Teacher_Screen> createState() => _Teacher_ScreenState();
}

class _Teacher_ScreenState extends State<Teacher_Screen> {
  int currentIndex = 1;
  final bottomNavigationBarItems = [
  const Icon(Icons.search, size: 30, color: kBlackColor),
  const Icon(Icons.home, size: 30, color: kBlackColor),
  const Icon(Icons.settings, size: 30, color: kBlackColor),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Teachers", style: TextStyle(color: kWhiteColor),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: kWhiteColor),
          ),
        ],
      ),
      // backgroundColor: const Color.fromRGBO(105, 36, 107, 1),
      resizeToAvoidBottomInset: false,
      body: const TeacherViewsBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              context: context,
              builder: (context) {
                return const BottomSheetBody_screen();
              });
        },
        child: const Icon(Icons.add, color: kBlackColor,),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        items: bottomNavigationBarItems,
        color: kPrimaryColor,
        backgroundColor: kWhiteColor, 
        buttonBackgroundColor: kPrimaryColor,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        onTap: (value) => 
        {
          print(value)
        },
      ),
    );
  }
}
