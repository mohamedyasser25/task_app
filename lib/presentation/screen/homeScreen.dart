import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/businessLogic/changeIndex/change_index_bloc.dart';
import 'package:magdsoft_task/constant/color.dart';
import 'package:magdsoft_task/presentation/screen/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController scrollController = ScrollController();
  ChangeIndexBloc? changeIndexBloc;
  @override
  void initState() {

    changeIndexBloc = BlocProvider.of<ChangeIndexBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    int navigationIndex = 4;
    Size size = MediaQuery.of(context).size;
    final iconList = [
    Icons.logout,
      Icons.favorite,
      Icons.notification_add,
      Icons.settings,
    ];

    final bodyList = [

      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.orange,
      ),
      Container(
        color: Colors.pink,
      ),
      Container(
        color: Colors.blue,
      ),
      Home(size: size),
    ];

    return Scaffold(
        bottomNavigationBar: AnimatedBottomNavigationBar(
          inactiveColor: searchIcon,
          activeColor: searchIcon,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          rightCornerRadius: 30,
          leftCornerRadius: 30,
          icons: iconList,
          activeIndex: 0,
          onTap: (index) {
            changeIndexBloc!.add(ChangeIndex(index));
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: faceColor,
          onPressed: () {
            changeIndexBloc!.add(ChangeIndex(4));
          },
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                      opictyColor.withOpacity(1),
                      opictyColor.withOpacity(0)
                    ])),
                child: BlocBuilder<ChangeIndexBloc, ChangeIndexState>(
                  builder: (context, state) {
                    if (state is ChangeState) {
             navigationIndex=         state.index;
                    }
                    return Container(child: bodyList[navigationIndex]);
                  },
                )

                )));
  }
}
