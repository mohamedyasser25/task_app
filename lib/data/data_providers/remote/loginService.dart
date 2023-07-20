import 'package:dio/dio.dart';
import 'package:magdsoft_task/constant/string.dart';

class LoginService{
  Dio dio;
  LoginService(this.dio) {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }
Future <Map<String,dynamic>>login(Map<String, dynamic> loginData)async{

   Response response = await dio.post('verifyPhone',data: loginData);

    return response.data;

}

  Future  <Map<String,dynamic>>verifyCode(String? code, String? phone) async{
    Response response = await dio.post('otp',data: {"code":code,"phone":phone});


    return response.data;
  }
}