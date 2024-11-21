import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/model/colors.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/accessibility/presenter/store/accessibility_store.dart';

class AccessibilityPageStateHandler {
  final AppStore _appStore;

  AccessibilityPageStateHandler(this._appStore);

  final AccessibilityStore _store = Modular.get();

  AccessibilityStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    _store.setStatusAltoContraste(ColorsApp.contraste);
    _store.setFontSize(FontsApp.tamanhoBase.toDouble());
  }

  void dispose() async => _store.dispose();
}
