import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static SharedPreferences? sharedPreferences;


  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future <bool> putData( {
  required String key,
  required dynamic value,
}) async
  {
   return await sharedPreferences!.setString(key, value);
  }

  static Future <bool> remove( {
    required String key,
  }) async
  {
    return await sharedPreferences!.remove(key);
  }

 static String? getData( {
    required String key,

  })
  {
     return sharedPreferences!.getString(key);
  }
}