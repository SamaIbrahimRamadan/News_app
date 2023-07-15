import 'package:shared_preferences/shared_preferences.dart';

// Cache.init() بعرفها في main
class Cache {
  static late SharedPreferences sharedPreference; //بعرف object
  static init() async {
    sharedPreference = await SharedPreferences.getInstance(); // عرفته
  }

  static Future<bool> putData(
      {required String key, required bool value}) async {
    return await sharedPreference.setBool(
        key, value); // بحط الداتا بتختف من نوع ل نوع
  }

  static bool? getData({required String key}) {
    return sharedPreference.getBool(key); // بقيم قيم
  }
}
