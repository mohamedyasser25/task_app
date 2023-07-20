import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getDataFromSharedPreference({required String key}) {
    return sharedPreferences!.getString(key);
  }

  static Future saveDataSharedPreference(
      {required String key, required dynamic value}) async {
  await sharedPreferences!.setString(key, value);

  }




}