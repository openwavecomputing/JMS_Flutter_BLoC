import 'package:jms_flutter_bloc/config/constants/pref_constants.dart';
import 'package:jms_flutter_bloc/modules/login/repo/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // Singleton approach
  static final SharedPrefs _instance = SharedPrefs._internal();
  factory SharedPrefs() => _instance;
  SharedPrefs._internal();

  // Login
  Future<void> addUser(User user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(PrefConstants.PREF_USER_STATUS, user.status);
    sharedPreferences.setString(PrefConstants.PREF_USER_ID, user.userId);
    sharedPreferences.setString(PrefConstants.PREF_USER_NAME, user.userName);
    sharedPreferences.setString(
        PrefConstants.PREF_USER_DEVICE_ID, user.deviceId);
    sharedPreferences.setString(
        PrefConstants.PREF_USER_DEVICE_PLATFORM, user.devicePlatform);
    sharedPreferences.setString(
        PrefConstants.PREF_USER_MASTER_ID, user.userMasterId);
    sharedPreferences.setString(
        PrefConstants.PREF_USER_GROUP_MASTER_ID, user.userGroupMasterId);
  }

  // Logout
  Future<void> removeUser(User user) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.remove(PrefConstants.PREF_USER_STATUS);
    sharedPreferences.remove(PrefConstants.PREF_USER_ID);
    sharedPreferences.remove(PrefConstants.PREF_USER_NAME);
    sharedPreferences.remove(PrefConstants.PREF_USER_DEVICE_ID);
    sharedPreferences.remove(PrefConstants.PREF_USER_DEVICE_PLATFORM);
    sharedPreferences.remove(PrefConstants.PREF_USER_MASTER_ID);
    sharedPreferences.remove(PrefConstants.PREF_USER_GROUP_MASTER_ID);
  }

  // Get User Id through out the app
  Future<String> getUserId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(PrefConstants.PREF_USER_MASTER_ID) ?? "";
  }


}
