import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/businessLogic/helpBloc/help_bloc.dart';
import 'package:magdsoft_task/businessLogic/loginBloc/login_bloc.dart';
import 'package:magdsoft_task/businessLogic/productsBloc/products_bloc.dart';
import 'package:magdsoft_task/data/models/productsResponse.dart';
import 'package:magdsoft_task/dependanceInjection.dart';

import 'package:magdsoft_task/presentation/screen/helpScreen.dart';
import 'package:magdsoft_task/presentation/screen/homeScreen.dart';
import 'package:magdsoft_task/presentation/screen/loginScreen.dart';
import 'package:magdsoft_task/presentation/screen/productScreen.dart';
import 'package:magdsoft_task/presentation/screen/verifyPhoneScreen.dart';


class AppRouter  {
  AppRouter () {
    initGetIt();
  }

  Route? route(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => getIt<LoginBloc>(),
                  child: const LoginScreen(),
                ));
      case '/verifyPhone':
        var code = routeSettings.arguments as String;


        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => getIt<LoginBloc>(),
                  child: VerifyPhone(code: code),
                ));
      case '/helpScreen':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<HelpBloc>(),
                child: const HelpScreen(),
              ),
        );

      case '/homeScreen':
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProductsBloc>(),
                child:  const HomeScreen(),
              ),
        );
      case '/product':
        var product = routeSettings.arguments as Products;
        return MaterialPageRoute(builder: (_) =>
            ProductScreen(product: product),
            );
    }


  }
}
