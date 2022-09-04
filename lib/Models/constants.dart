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

const buttonsContainerColorLight = Color(0xffe5e4e0);
const resetButtonColorLight = Color(0xff388187);
const resetButtonColorDark = Color(0xffd03f30);
const equalSignColorLight = Color(0xffc85401);
const equalSignColorDark = Color(0xff647299);
const delColorLight = Color(0xff388187);
//const delColorDark = Color(value);