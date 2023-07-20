import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//this is the textFiled   that used in OtpVerify
class OtpVerify extends StatelessWidget {
  final bool first,last;
 final TextEditingController controller;
  const OtpVerify({required this.first,required this.last,Key? key, required this. controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {


  return SizedBox(
    height: 80,
    width: 70,
    child: TextField(keyboardType: TextInputType.number,textAlign: TextAlign.center,controller: controller,inputFormatters: [LengthLimitingTextInputFormatter(1),FilteringTextInputFormatter.digitsOnly],onChanged: (value){
      if(value.length==1 && last==false){
        FocusScope.of(context).nextFocus();
      }
      if(value.isEmpty && first==false){
        FocusScope.of(context).previousFocus();
      }
    },

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),
      ),
    ),
  );
}}
