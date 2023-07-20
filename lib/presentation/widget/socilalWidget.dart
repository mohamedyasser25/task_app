import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color.dart';
//this widget for login with facebook,google,apple
Widget customCircle(String image){return   Container(decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(blurRadius: 20, color: elevationColor)
      ],
      borderRadius: BorderRadius.circular(50),
    ),
    child: CircleAvatar(backgroundColor: Colors.white,radius: 50,child:Image.asset(image) ,));
//
}
