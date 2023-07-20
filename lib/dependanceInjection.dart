import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:magdsoft_task/businessLogic/helpBloc/help_bloc.dart';
import 'package:magdsoft_task/businessLogic/loginBloc/login_bloc.dart';
import 'package:magdsoft_task/businessLogic/productsBloc/products_bloc.dart';
import 'package:magdsoft_task/data/data_providers/remote/helpService.dart';
import 'package:magdsoft_task/data/data_providers/remote/loginService.dart';
import 'package:magdsoft_task/data/data_providers/remote/productsService.dart';
import 'package:magdsoft_task/data/repository/helpRepository.dart';
import 'package:magdsoft_task/data/repository/loginRepository.dart';
import 'package:magdsoft_task/data/repository/productsRepository.dart';

final getIt = GetIt.I;
void initGetIt() {
  getIt.registerLazySingleton<LoginBloc>(
      () => LoginBloc(getIt()));
  getIt.registerLazySingleton<HelpBloc>(
      () => HelpBloc(getIt()));
  getIt.registerLazySingleton<ProductsBloc>(
      () => ProductsBloc(getIt()));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton<HelpRepository>(() => HelpRepository(getIt()));
  getIt.registerLazySingleton<ProductsRepository>(() => ProductsRepository(getIt()));

  getIt.registerLazySingleton<LoginService>(() => LoginService(Dio()));
  getIt.registerLazySingleton<ProductsService>(() => ProductsService(Dio()));

  getIt.registerLazySingleton<HelpService>(() => HelpService(Dio()));

}
