import 'package:mobx/mobx.dart';
import 'package:agendacultural/app/modules/introduction/domain/entities/languages_model.dart';

part 'language_store.g.dart';

class LanguageStore = LanguageStoreBase with _$LanguageStore;

abstract class LanguageStoreBase with Store {
  @observable
  Language languageSelecionada = Language.languageList().first;

  @action
  void setLanguageSelecionada(Language value) => languageSelecionada = value;

  @action
  void dispose() {}
}
