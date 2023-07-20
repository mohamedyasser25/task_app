import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/businessLogic/changeIndex/change_index_bloc.dart';
import 'package:magdsoft_task/data/data_providers/local/localShared.dart';
import 'package:magdsoft_task/presentation/router/app_router.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
CacheHelper.  init();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  AppRouter? appRouter;

  MyApp({this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => ChangeIndexBloc(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter!.route,
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),

            ),
          );
        });
  }
}

