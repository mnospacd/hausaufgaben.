import 'package:shared_preferences/shared_preferences.dart';

class localStorage {
  static late final SharedPreferences instance;

  static bool _init = false;
  static Future init() async {
    if (_init) return;
    instance = await SharedPreferences.getInstance();
    _init = true;
    return instance;
  }
}