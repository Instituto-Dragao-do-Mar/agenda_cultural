import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/store/filters_store.dart';

class FiltersPageStateHandler {
  final AppStore _appStore;

  FiltersPageStateHandler(this._appStore);

  final FiltersStore _store = Modular.get();

  FiltersStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() {
    // Configura as opções de categoria com limite inicial de 4 e 'Ver mais'
    _store.setOptionsCategories([..._appStore.categories.map((e) => e.nome ?? '').toList().take(4), 'Ver mais']);

    // Configura as opções de classificação etária
    for (Event event in _appStore.events) {
      if (!_store.optionsClassification.any((element) => element == event.classificacaoetaria)) {
        _store.optionsClassification.add(event.classificacaoetaria!);
      }
    }

    // Configura as opções de acessibilidade com limite inicial de 4 e 'Ver mais'
    final allAccessibilityOptions = <String>{};
    for (Space space in _appStore.spaces) {
      if (space.acessibilidadeFisica != null && space.acessibilidadeFisica!.isNotEmpty) {
        allAccessibilityOptions.addAll(space.acessibilidadeFisica!.split(';'));
      }
    }

    _store.setOptionsAccessibility([...allAccessibilityOptions.toList().take(4), 'Ver mais']);
  }

  void dispose() async => _store.dispose();
}
