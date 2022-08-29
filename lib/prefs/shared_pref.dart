
import 'package:perfume_store/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, name, id, gender, mobile, cityEn,cityAr,language,token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.name.toString(), user.name);
    await _sharedPreferences.setString(
        PrefKeys.mobile.toString(), user.mobile);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setInt(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(PrefKeys.cityAr.toString(), user.city.nameAr);
    await _sharedPreferences.setString(PrefKeys.cityEn.toString(), user.city.nameEn);

  }
  Future<bool> setLanguage(String languageCode) async {
    return await _sharedPreferences.setString('language_code', languageCode);
  }
  String get languageCode => _sharedPreferences.getString('language_code') ?? 'en';
  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;


  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
