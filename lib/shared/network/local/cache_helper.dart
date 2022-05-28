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
  static bool? getBoolean({
    required String key,
  })
  {
    return sharedPreferences.getBool(key);
  }

}