import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/value/constant.dart';

class StoreageService {
  late final SharedPreferences _prefs;
  Future<StoreageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

 Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }


 bool getDeviceFirstopen(){
   return _prefs.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME)?? false;
 }

 bool getIslogedin(){
   return _prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null ? false : true;
 }

Future <bool> removeToken(String key)  {
  return  _prefs.remove(key);
}

}
