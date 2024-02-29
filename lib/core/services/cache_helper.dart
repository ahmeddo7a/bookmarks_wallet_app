import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences;
  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> saveIntData({
    required String key,
    required int value,
  }) async => await sharedPreferences.setInt(key, value);


  static Future<bool> saveStringData({
    required String key,
    required String value,
  }) async => await sharedPreferences.setString(key, value);

  static dynamic getData({
    required String key,
  }){
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async{
    return await sharedPreferences.remove(key);
  }
}