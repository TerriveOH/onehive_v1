import 'package:shared_preferences/shared_preferences.dart';

class myPrefs {
  myPrefs._();
  static final myPrefs _instance = myPrefs._();
  factory myPrefs() {
    return _instance;
  }

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
}
