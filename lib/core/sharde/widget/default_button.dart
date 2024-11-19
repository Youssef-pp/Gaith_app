

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DefaultButton extends StatelessWidget {
  String text;
  Function function;
  DefaultButton({super.key, required this.text,required this.function});
  @override
  Widget build(BuildContext context) {
    return
      Container(
  decoration: BoxDecoration(
    color:  const Color(0xff22AAE4),
    borderRadius: BorderRadius.circular(8.0),
  ),
  width: double.infinity,
  height: 40.h,

  child: MaterialButton(
    onPressed:(){function();},
    child: Text(
      text,

      style: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: 'Tajawal',
    ),


      ),

  ),
);
  }
}
