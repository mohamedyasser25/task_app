import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/helpBloc/help_bloc.dart';
import 'package:magdsoft_task/data/models/helpResponse.dart';
import 'package:magdsoft_task/presentation/widget/expansionTile.dart';
import 'package:magdsoft_task/presentation/widget/screenTitle.dart';


import '../../constant/color.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<Help> helpList=[];
  @override
  void initState() {
    BlocProvider.of<HelpBloc>(context).add(GetHelpEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            opictyColor.withOpacity(0.85),
            opictyColor.withOpacity(0),
          ],
        ),
      ),
      child: Column(
        children: [
           SizedBox(
            height: 50.h,
          ),
          screenTitle(title: "Help", color: Colors.white),
           SizedBox(
            height: 65.h,
          ),

          Expanded(child:
              BlocBuilder<HelpBloc, HelpState>(builder: (context, state) {
            if (state is GetHelpState) {
              helpList = state.helpResponse.help!;
            } else if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return
              ListView.separated(
                itemBuilder: (context, index) => expansionTile(
                    title: helpList[index].question.toString(),
                    subTitle: helpList[index].answer.toString()),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: helpList.length);

          })
  )
          ,
          Padding(
            padding:  EdgeInsets.only(right:75.w,left: 75.w,bottom: 25.h ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(colors: [
                      opictyColor.withOpacity(1.0),
                      opictyColor.withOpacity(0.5),
                      opictyColor.withOpacity(0.27)
                    ])),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/homeScreen'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width, 50.h),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
                  ),
                )),
          )

        ],
      ),
    )));
  }
}
