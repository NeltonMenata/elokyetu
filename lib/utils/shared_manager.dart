import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {

  static const String _invalidAttempts = 'invalidAttempts';
  static const String _fingerPrintEnabled = 'fingerPrintEnabled';
  static const String _deviceToken = 'deviceToken';

  static int getInvalidAttempts(SharedPreferences? preferences){
    return preferences!.getInt(_invalidAttempts) ?? 0;
  }

  static setInvalidAttempts(SharedPreferences? preferences, int attempts){
    preferences!.setInt(_invalidAttempts, attempts);
  }

  static bool isFingerPrintEnable(SharedPreferences? preferences){
    return preferences!.getBool(_fingerPrintEnabled) ?? false;
  }

  static setFingerPrintEnable(SharedPreferences? preferences, bool enable){
    preferences!.setBool(_fingerPrintEnabled, enable);
  }

  static String getDeviceToken(SharedPreferences? preferences){
    return preferences!.getString(_deviceToken) ?? "";
  }

  static setDeviceToken(SharedPreferences? preferences, String token){
    preferences!.setString(_deviceToken, token);
  }

  static const String _dynamicInvitee = 'invitee';

  void setInvitee(SharedPreferences? preferences, String objectId){
    preferences!.setString(_dynamicInvitee, objectId);
  }

  String? getInvitee(SharedPreferences? preferences){
    return preferences!.getString(_dynamicInvitee) ?? "";
  }

  void clearInvitee(SharedPreferences? preferences){
    preferences!.setString(_dynamicInvitee, "");
  }

}