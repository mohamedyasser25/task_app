import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/loginBloc/login_bloc.dart';
import 'package:magdsoft_task/constant/color.dart';

import 'package:magdsoft_task/presentation/view/customButton.dart';
import 'package:magdsoft_task/presentation/view/otpVerify.dart';
import 'package:magdsoft_task/presentation/widget/screenTitle.dart';

class VerifyPhone extends StatelessWidget {
 final String code;
  TextEditingController? firstController,secondController,thirdController,fordController;
   LoginBloc? loginBloc;
   VerifyPhone({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
loginBloc=BlocProvider.of(context);
    firstController=  TextEditingController(text: code[0]);
 secondController=TextEditingController(text: code[1]);
 thirdController=TextEditingController(text: code[2]);
 fordController=TextEditingController(text: code[3]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                opictyColor.withOpacity(0.85),
                opictyColor.withOpacity(0)
              ])),
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(right: 43.w,left: 43.w),
              child: Column(
                children: [
                  SizedBox(height: 63.h,),

                  screenTitle(title:'Verify Phone',color:Colors.white)
                 , SizedBox(
                    height: 138.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpVerify(first: true, last: false,controller:firstController!),
                      OtpVerify(first: true, last: false,controller:secondController!),
                      OtpVerify(first: true, last: false, controller:thirdController!),
                      OtpVerify(first: true, last: false,controller:fordController!)
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: faceColor),
                      )),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomButton(size:size,title: "Verify",onPressed: onPressed,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  onPressed(){

           loginBloc!.add(VerifyCode(firstController!.value.text, secondController!.value.text,thirdController!.value.text,fordController!.value.text));

  }
}
