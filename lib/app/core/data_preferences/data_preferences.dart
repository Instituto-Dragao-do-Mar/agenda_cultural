import 'package:shared_preferences/shared_preferences.dart';

class Dados {
  static SharedPreferences? prefs;

  static bool jaVisualizouIntroducao = false;
  static bool jaVisualizouCookies = false;
  static bool jaVisualizouGoverno = false;
  static bool jaPermitiuLocalizacao = false;
  static String idiomaSalvo = '';

  static Future<SharedPreferences> getprefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<String> getString(String key) async {
    prefs ??= await getprefs();
    return prefs!.getString(key) ?? "";
  }

  static Future<int> getInt(String key) async {
    prefs ??= await getprefs();
    return prefs!.getInt(key) ?? 0;
  }

  static Future<double> getDouble(String key) async {
    prefs ??= await getprefs();
    return prefs!.getDouble(key) ?? 0;
  }

  static Future<bool> getBool(String key) async {
    prefs ??= await getprefs();
    return prefs!.getBool(key) ?? false;
  }

  static Future<void> setBool(String key, bool value) async {
    if (key == 'cookies' || jaVisualizouCookies) {
      prefs ??= await getprefs();
      prefs!.setBool(key, value);
    }
  }

  static Future<void> setString(String key, String value) async {
    if ((key == 'cookies' || jaVisualizouCookies) || key == 'idioma') {
      prefs ??= await getprefs();
      prefs!.setString(key, value);
    }
  }

  static Future<void> setInt(String key, int value) async {
    if (key == 'cookies' || jaVisualizouCookies) {
      prefs ??= await getprefs();
      prefs!.setInt(key, value);
    }
  }

  static Future<void> setDouble(String key, double value) async {
    if (key == 'cookies' || jaVisualizouCookies) {
      prefs ??= await getprefs();
      prefs!.setDouble(key, value);
    }
  }
}
