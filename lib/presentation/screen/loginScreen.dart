import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/constant/color.dart';
import 'package:magdsoft_task/presentation/view/loginCard.dart';
import 'package:magdsoft_task/presentation/widget/socilalWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Stack(children: [
        SizedBox(
          width: size.width,
          child: Image.asset("assets/loginBackground.png",
              fit: BoxFit.cover,
              color: opictyColor.withOpacity(.5),
              colorBlendMode: BlendMode.color),
        ),
        Padding(
          padding: EdgeInsets.only(top: 300.h),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 349.h, left: 28.w, right: 28.w),
                  child: Row(
                    children: [
                       Expanded(
                          child: Divider(
                        color: dividerColor,
                        thickness: 1.h,
                        endIndent: 15.w,
                      )),
                      Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: orColor,
                            fontWeight: FontWeight.w400),
                      ),
                       Expanded(
                        child: Divider(
                          color: dividerColor,
                          thickness: 1.h,
                          indent: 15.w,
                        ),
                      )
                    ],
                  ),
                ),
                //SizedBox(height: 85,),
                Padding(
                  padding: EdgeInsets.only(top: 85.h, bottom: 120.h),
                  child: SizedBox(
                    height: 70.h,
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(decoration: BoxDecoration(
                            color: Colors.pink,
                            boxShadow: const [
                              BoxShadow(blurRadius: 20, color: elevationColor)
                            ],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(backgroundColor: Colors.white,radius: 50,child:  Text(
                            'f',
                            style: TextStyle(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.w400,
                                color: faceColor),
                          ),),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        customCircle('assets/ios.png'),
                        SizedBox(
                          width: 10.w,
                        ),
                        customCircle('assets/google.png')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 193.h, right: 30.w, left: 30.w),
            child: LoginCard(size))
      ]),
    )));
  }
}
