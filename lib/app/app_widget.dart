import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _AppWidgetState? state = context.findAncestorStateOfType<_AppWidgetState>();
    state?.setLocale(newLocale);
  }
}

class _AppWidgetState extends State<AppWidget> {
  Locale? _locale;

  setLocale(Locale locale) => setState(() => _locale = locale);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      title: 'Cultura.CE',
      theme: themeDefault,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: EasyLoading.init(),
      routerConfig: Modular.routerConfig,
    );
  }
}
