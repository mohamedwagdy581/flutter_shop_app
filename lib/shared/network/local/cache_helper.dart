import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static late SharedPreferences sharedPreferences;

  static intit() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Function to set Data in SharedPreferences
  static Future<bool> setBoolean ({
    required String key,
    required bool value,
  }) async
  {
    return await sharedPreferences.setBool(key, value);
  }

  // Function to Get Data to SharedPreferences
  static dynamic getData({
    required String key,
  })
  {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData (
    {
      required String key,
      required dynamic value,
    }) async 
    {
      if(value is String) return await sharedPreferences.setString(key, value);
      if(value is bool) return await sharedPreferences.setBool(key, value);
      if(value is int) return await sharedPreferences.setInt(key, value);
      return await sharedPreferences.setDouble(key, value);
    }

  static Future<bool> removeData (
    {
      required String key,
    }) async 
    {
      return await sharedPreferences.remove(key);
    }

}