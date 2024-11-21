import 'package:agendacultural/model/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static String userGuidId = "";
  static String userToken = "";
  static String userEmail = "";
  static String userName = "";

  static String? _checkIsEmpty(String? data) {
    return data ?? (data == '' ? null : data);
  }

  static Future<User?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var user = User(
      guidid: _checkIsEmpty(prefs.getString('userguidid')),
      signature: _checkIsEmpty(prefs.getString('usertoken')),
      email: _checkIsEmpty(prefs.getString('useremail')),
      login: _checkIsEmpty(prefs.getString('useremail')),
      nome: _checkIsEmpty(prefs.getString('username')),
    );

    return (user.signature != null && user.signature!.isNotEmpty) ? user : null;
  }

  static Future<void> setUser({
    required String userguidid,
    required String usertoken,
    String? email,
    String? nome,
  }) async {
    userGuidId = userguidid;
    userToken = usertoken;
    userEmail = email ?? "";
    userName = nome ?? "";

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userguidid', userguidid);
    await prefs.setString('usertoken', usertoken);
    await prefs.setString('useremail', email ?? "");
    await prefs.setString('username', nome ?? "");
  }

  static Future<void> resetUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userguidid', '');
    await prefs.setString('usertoken', '');
    await prefs.setString('useremail', '');
    await prefs.setString('username', '');
  }
}
