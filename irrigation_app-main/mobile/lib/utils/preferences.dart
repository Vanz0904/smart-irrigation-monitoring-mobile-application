import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future setItem(key, value) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.setString(key, value);
}

Future getItem(key) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.getString(key);
}

Future<bool> setIsLoggedIn(key, value) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.setBool(key, value);
}

Future<bool?> getIsLoggedIn(key) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.getBool(key);
}

Future removeItem(key) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.remove(key);
}
