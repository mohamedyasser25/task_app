
import 'package:magdsoft_task/data/data_providers/local/localShared.dart';
import 'package:magdsoft_task/data/data_providers/remote/loginService.dart';
import 'package:magdsoft_task/data/models/loginRequst.dart';
import 'package:magdsoft_task/data/models/loginResponse.dart';
import 'package:magdsoft_task/data/models/verifyResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  LoginService loginService ;
  LoginRepository(this.loginService);

  Future<LoginResponse> login(String name, String phone) async {


    CacheHelper.saveDataSharedPreference(key: 'phone', value: phone);
    var loginData = LoginRequest(name: name, phone: phone).toJson();
    var response = await loginService.login(loginData);
    return LoginResponse.fromJson(response);
  }

  Future<VerifyResponse> verifyCode(String first, String second, String third, String ford) async{
    String code='$first$second$third$ford';

    var phone = CacheHelper.getDataFromSharedPreference(key: 'phone');
    var response = await  loginService.verifyCode(code,phone);
    return VerifyResponse.fromJson(response);
  }
}
