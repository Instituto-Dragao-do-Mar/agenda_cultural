import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/introduction/domain/entities/languages_model.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/language/presenter/store/language_store.dart';

class LanguagePageStateHandler {
  final AppStore _appStore;

  LanguagePageStateHandler(this._appStore);

  final LanguageStore _store = Modular.get();

  LanguageStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    String idiomaSalvo = Dados.idiomaSalvo;
    _store.setLanguageSelecionada(Language.languageList().firstWhere(
      (language) => language.languageCode == idiomaSalvo,
      orElse: () => Language(1, 'bandeirabrasil.png', 'Português', 'pt'),
    ));
  }

  void dispose() async => _store.dispose();
}
