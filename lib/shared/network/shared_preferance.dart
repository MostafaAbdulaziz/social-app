import 'package:shared_preferences/shared_preferences.dart';

class Sharedreference
{
  static late SharedPreferences sharedPreference;

  static init()
  {
    sharedPreference=SharedPreferences.getInstance() as SharedPreferences;
  }

  static Future<bool> setBoolData({
    required String key,
    required bool value
})async
  {
    return await sharedPreference.setBool(key, value);
  }



  static getBoolData({
    required String key
})
{
  sharedPreference.get(key);
}

static Future<bool> saveData({
  required String key,
  required dynamic value
})async
{
  if(value is String)
  {
    return await sharedPreference.setString(key, value);
  }else if(value is int)
  {
    return await sharedPreference.setInt(key, value);
  }else
  {
    return await sharedPreference.setDouble(key, value);
  }
}


static Future<bool> removeData({
    required String key
})async
{
  return await sharedPreference.remove(key);
}


}