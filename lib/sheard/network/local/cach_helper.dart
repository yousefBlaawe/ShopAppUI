import 'package:shared_preferences/shared_preferences.dart';

class cachHelper
{
  static SharedPreferences? sharedPreferences;
  static initail()
  async {
    sharedPreferences= await SharedPreferences.getInstance();
  }
  // عشان اعمل creat for cach helper
  // بستدعيه من ال main

  static  Future<bool?> putData(
      {required String key, required bool val,})
  async {
    return  await  sharedPreferences?.setBool(key, val);
  }
  // بقدر استغني عنها لاني عامل وحده شامله تحت

  static dynamic getData(
      {required String key})
  {
    return    sharedPreferences?.get(key);
  }
  // بترجع


  static Future<bool?>SaveData({
    required String key,
    required dynamic val
  })async

  {
    if(val is String )
      return await  sharedPreferences?.setString(key, val);
    if(val is bool )
      return await  sharedPreferences?.setBool(key, val);
    if(val is int )
      return await  sharedPreferences?.setInt(key, val);

    return await sharedPreferences?.setDouble(key, val);
  }
// بتخزن اشي صار يعني مثلا login عشان مش كل مره اعمل login بعمل مره وحده وببعتله
  // بتوخد key وظيفته انه يميز اشي عن باقس ال keys

  static Future<bool?> removeData({required String key})
  async {
    return await  sharedPreferences?.remove(key);
  }
}