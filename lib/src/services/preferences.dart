import 'package:shared_preferences/shared_preferences.dart';

const _KEY_USERS = 'KEY_USERS';
const _KEY_CURRENT_USER = 'KEY_CURRENT_USER';

class Preferences {
  const Preferences._();

  static SharedPreferences _prefs;
  static Preferences _instance;

  static Preferences get instance => _instance ?? Preferences._();
  //static SharedPreferences get prefs => _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getUsers() => _prefs.getString(_KEY_USERS) ?? null;

  Future<bool> setUsers(String str) {
    if (str == null) {
      return _prefs.remove(_KEY_USERS);
    }
    return _prefs.setString(_KEY_USERS, str);
  }

  String getCurrentUser() => _prefs.getString(_KEY_CURRENT_USER) ?? null;

  Future<bool> setCurrentUser(String str) {
    if (str == null) {
      return _prefs.remove(_KEY_CURRENT_USER);
    }
    return _prefs.setString(_KEY_CURRENT_USER, str);
  }
}
