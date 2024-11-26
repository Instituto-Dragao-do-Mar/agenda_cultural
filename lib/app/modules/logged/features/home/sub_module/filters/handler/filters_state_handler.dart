import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/capitalize.dart';
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
    // Configura as opções de espaço
    _store.setOptionsSpaces(
      _appStore.spaces.where((space) => space.aprovado == 1).map((space) => space.nome ?? '').toList(),
    );

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

  void apllyFilter() {
    final filteredEvents = _appStore.events.where((event) {
      var eventsDate = event.eventosdatas!.first;
      Space spaceReal = _appStore.spaces.firstWhere((element) => element.id == eventsDate.idespaco);
      Space spacePrincipal;

      if (event.aprovado != 1) {
        return false;
      }

      if (_appStore.optionSelectedSpace.isNotEmpty || _appStore.optionSelectedSpace != '') {
        if (spaceReal.idespacoprincipal == 0) {
          if (spaceReal.nome != _appStore.optionSelectedSpace) {
            return false;
          }
        } else {
          spacePrincipal = _appStore.spaces.firstWhere((element) => element.id == spaceReal.idespacoprincipal);
          if (spacePrincipal.nome != _appStore.optionSelectedSpace) {
            return false;
          }
        }
      }

      if (_appStore.optionSelectedPeriode.isNotEmpty) {}

      if (_appStore.optionSelectedCategory.isNotEmpty) {
        final categoriesEvent = event.eventoscategorias!
            .map((e) => _appStore.categories.firstWhere((element) => element.id == e.idcategoria).nome?.capitalize())
            .join(', ');

        if (!categoriesEvent.contains(_appStore.optionSelectedCategory)) {
          return false;
        }
      }

      if (_appStore.optionSelectedClassification.isNotEmpty) {
        if (!(event.classificacaoetaria?.contains(_appStore.optionSelectedClassification) == true)) {
          return false;
        }
      }

      if (_appStore.optionSelectedAccessibility.isNotEmpty) {
        final accessibilityEvent = spaceReal.acessibilidadeFisica ?? '';
        final accessibilityList = accessibilityEvent.split(';');

        if (!accessibilityList.contains(_appStore.optionSelectedAccessibility)) {
          return false;
        }
      }

      if (_appStore.optionSelectedTicket.isNotEmpty) {
        if (!(event.eventosdatas?.first.preco?.contains(_appStore.optionSelectedTicket) == true)) {
          return false;
        }
      }

      return true;
    }).toList();

    _appStore.setEventsFiltered(filteredEvents);
    _appStore.setIsFilterOpen(true);
    Modular.to.pop();
  }

  void dispose() => _store.dispose();
}
