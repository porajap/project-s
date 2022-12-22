import 'package:project_s/src/models/logged_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceKey {
  static final String isLogin = "isLogin";
  static final String phone = "phone";

  static final String fName = "fName";
  static final String lName = "lName";
  static final String token = "token";
}

class SharedPreferencesService{
  Future<void> setIsLoggedIn({required bool isLogin}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool(PreferenceKey.isLogin, isLogin);
  }

  Future<bool> getIsLoggedIn() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool _data = _prefs.getBool(PreferenceKey.isLogin) ?? false;
    return _data;
  }

  Future<void> clearDataUser() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  Future<void> setUserLoggedIn({required LoggedModel data}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _prefs.setString(PreferenceKey.fName, data.user?.thFrist ?? "");
    _prefs.setString(PreferenceKey.lName, data.user?.thLast ?? "");
    _prefs.setString(PreferenceKey.token, data.accessToken ?? "");
  }

  Future<String> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _data = _prefs.getString(PreferenceKey.token) ?? "";
    return _data;
  }


  Future<String> getPhone() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _data = _prefs.getString(PreferenceKey.phone) ?? "";
    return _data;
  }

  Future<void> setPhone({required String phone}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(PreferenceKey.phone, phone);
  }
}