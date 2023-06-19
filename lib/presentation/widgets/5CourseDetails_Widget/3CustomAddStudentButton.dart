import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';

class CustomAddStudentButton extends StatelessWidget {
  CustomAddStudentButton(
      {super.key,
      this.onTap,
      this.isLoading = false,
      required this.lengthStudent});

  final void Function()? onTap;
  final int lengthStudent;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(
                16,
              )),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : Row(
                    children: [
                      Spacer(),
                      Text(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        "${lengthStudent.toString()} إلى المجموعة",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const Text(
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        'إضافة',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
