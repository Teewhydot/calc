import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget addVerticalSpacing (double height){
  return SizedBox(
    height: height.h,
  );
}


Widget addHorizontalSpacing (double width){
  return SizedBox(
    width: width.w,
  );
}