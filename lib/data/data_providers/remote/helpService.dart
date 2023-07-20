import 'package:dio/dio.dart';
import 'package:magdsoft_task/constant/string.dart';

class HelpService{
   Dio dio;

   HelpService(this.dio) {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  Future <Map<String,dynamic>>getHelp()async{

    Response response = await dio.get('getHelp');

    return response.data;

  }
}