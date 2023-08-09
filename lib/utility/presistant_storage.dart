import 'package:shared_preferences/shared_preferences.dart';

class PresistentStorage {
  var _SHARED_PREFERENCES_INSTANCE;
  Future _setInstance() async {
    this._SHARED_PREFERENCES_INSTANCE = await SharedPreferences.getInstance();
    return this._SHARED_PREFERENCES_INSTANCE;
  }

  setCurrentLanguage({locale = 'ar'}) async {
    //setting up the shared prefernces instance
    await _setInstance();

    await _SHARED_PREFERENCES_INSTANCE.setString('locale', locale);
  }

  setUserInfo(
      {required email,
      required String refresh,
      required String access,
      required String password}) async {
    //setting up the shared prefernces instance
    await _setInstance();
    await _SHARED_PREFERENCES_INSTANCE.setString('email', email);
    await _SHARED_PREFERENCES_INSTANCE.setString('refresh', refresh);
    await _SHARED_PREFERENCES_INSTANCE.setString('access', access);
    await _SHARED_PREFERENCES_INSTANCE.setString('password', password);
  }

  Future getEmail() async {
    await _setInstance();
    return await this._SHARED_PREFERENCES_INSTANCE.getString('email');
  }

  Future getPassword() async {
    await _setInstance();
    return await this._SHARED_PREFERENCES_INSTANCE.getString('password');
  }

  Future getCurrentLanguage() async {
    await _setInstance();
    return await this._SHARED_PREFERENCES_INSTANCE.getString('locale');
  }
}
