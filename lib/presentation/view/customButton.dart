import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/loginBloc/login_bloc.dart';

import '../../constant/color.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final String title;
  final VoidCallback onPressed;

  const CustomButton(
      {required this.size, required this.title, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(colors: [
            opictyColor.withOpacity(1.0),
            opictyColor.withOpacity(0.5),
            opictyColor.withOpacity(0.27)
          ])),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is Loaded){
           Navigator.pushNamed(context, '/verifyPhone',arguments: state.code);
          }
         else if(state is VerifyLoaded){
            Navigator.pushNamed(context, '/helpScreen');
          }
        },
        builder: (context, state) {
          if(state is Loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width, 50.h),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 20.sp),
            ),
          );
        },
      ),
    );
  }
}