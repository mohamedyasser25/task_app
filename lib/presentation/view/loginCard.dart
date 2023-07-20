import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/loginBloc/login_bloc.dart';
import 'package:magdsoft_task/presentation/view/customButton.dart';
import 'package:magdsoft_task/presentation/widget/screenTitle.dart';

import '../../constant/color.dart';
// this is Card for fullName and phone number in loginScreen
class LoginCard extends StatefulWidget {
  final Size size;
  const LoginCard(this.size, {Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  Size? size;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginBloc? loginBloc ;
  @override
  void initState() {
    super.initState();
    size = widget.size;
   loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 372.h,
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: elevationColor, blurRadius: 20)],
          color: Colors.white,
          borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding:  EdgeInsets.only(right: 44.w, left: 44.w),
        child: Column(
          children: [
             SizedBox(
              height: 28.h,
            ),
            screenTitle(title: 'Welcome', color: textColor),

             Divider(
              color: dividerColor,
              thickness: 3.h,
              indent: 45.w,
              endIndent: 45.w,
            ),
             SizedBox(
              height: 42.h,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: elevationColor, blurRadius: 8)
                      ]),
                      child: TextFormField(
                        controller: nameController,

                        decoration: InputDecoration(
                            hintText: 'Enter your FullName',
                            hintStyle:  TextStyle(
                                fontSize: 16.sp,
                                color: searchIcon,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                     SizedBox(
                      height: 15.sp,
                    ),
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: elevationColor, blurRadius: 8)
                      ]),
                      child: TextFormField(keyboardType: TextInputType.number,
                        controller: phoneController,
                        validator: (phone) => phone!.length <10
                            ? 'phone number must be more than 10'
                            : null,
                        decoration: InputDecoration(
                            hintText: 'Enter your PhoneNumber',
                            hintStyle:  TextStyle(
                                fontSize: 16.sp,
                                color: searchIcon,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                     SizedBox(
                      height: 30.h,
                    ),

                    CustomButton(
                        size: size!,
                        title: 'Login',
                        onPressed: onPressed

                        ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
   onPressed(){

       formKey.currentState!.validate()
           ? loginBloc!.add(Login(nameController.value.text, phoneController.value.text))
           : null;
     }
  //
  // }
}
