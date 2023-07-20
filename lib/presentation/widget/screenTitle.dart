import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//this widget for every screen title
screenTitle({required String title, required Color color}) {
  return Text(
    title,
    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30.sp, color: color),
  );
}



