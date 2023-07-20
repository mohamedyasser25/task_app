import 'package:dio/dio.dart';
import 'package:magdsoft_task/constant/string.dart';

class ProductsService{
  Dio dio;
  ProductsService(this.dio) {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  Future <Map<String,dynamic>>getProducts()async{

    Response response = await dio.get('getProducts');
    return response.data;

  }
}