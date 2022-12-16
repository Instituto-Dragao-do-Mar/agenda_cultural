/*

String USERGUIDID = "";
String USERTOKEN = "";

 */
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static String userGuidId = "";
  static String userToken = "";

  static Future<bool> isUser() async {
    if (userGuidId.isEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      userGuidId = (prefs.getString('userguidid') ?? "");
      userToken = (prefs.getString('usertoken') ?? "");
    }
    return userGuidId.isNotEmpty;
  }

  static Future<void> setUser({
    required String userguidid,
    required String usertoken,
  }) async {
    userGuidId = userguidid;
    userToken = usertoken;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userguidid', userguidid);
    await prefs.setString('usertoken', usertoken);
  }

  static Future<void> resetUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userguidid', "");
    await prefs.setString('usertoken', "");
  }
}
