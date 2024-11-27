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
    // Spaces
    _store.setOptionsSpaces(
      _appStore.spaces.where((space) => space.aprovado == 1).map((space) => space.nome ?? '').toList(),
    );

    // Periode
    if (_appStore.optionSelectedPeriode != '') {
      if (_appStore.optionSelectedPeriode == 'Hoje') {
        _store.controllerGroupPeriode.selectIndex(0);
      } else if (_appStore.optionSelectedPeriode == 'Amanhã') {
        _store.controllerGroupPeriode.selectIndex(1);
      } else if (_appStore.optionSelectedPeriode == 'Essa Semana') {
        _store.controllerGroupPeriode.selectIndex(2);
      } else if (_appStore.optionSelectedPeriode == 'Próxima Semana') {
        _store.controllerGroupPeriode.selectIndex(3);
      } else if (_appStore.optionSelectedPeriode == 'Próximo Mês') {
        _store.controllerGroupPeriode.selectIndex(4);
      }
    }

    // Categories
    _store.setOptionsCategories([..._appStore.categories.map((e) => e.nome ?? '').toList().take(4), 'Ver mais']);
    if (_appStore.optionSelectedCategory != '' && _store.optionsCategories.contains(_appStore.optionSelectedCategory)) {
      _store.controllerGroupCategory.selectIndex(_store.optionsCategories.indexOf(_appStore.optionSelectedCategory));
    }

    // Classification
    for (Event event in _appStore.events) {
      if (!_store.optionsClassification.any((element) => element == event.classificacaoetaria)) {
        _store.optionsClassification.add(event.classificacaoetaria!);
      }
    }
    if (_appStore.optionSelectedClassification != '' &&
        _store.optionsClassification.contains(_appStore.optionSelectedClassification)) {
      _store.controllerGroupClassification.selectIndex(
        _store.optionsClassification.indexOf(_appStore.optionSelectedClassification),
      );
    }

    // Accessibility
    final allAccessibilityOptions = <String>{};
    for (Space space in _appStore.spaces) {
      if (space.acessibilidadeFisica != null && space.acessibilidadeFisica!.isNotEmpty) {
        allAccessibilityOptions.addAll(space.acessibilidadeFisica!.split(';'));
      }
    }
    _store.setOptionsAccessibility([...allAccessibilityOptions.toList().take(4), 'Ver mais']);
    if (_appStore.optionSelectedAccessibility != '' &&
        _store.optionsAccessibility.contains(_appStore.optionSelectedAccessibility)) {
      _store.controllerGroupAccessibility.selectIndex(
        _store.optionsAccessibility.indexOf(_appStore.optionSelectedAccessibility),
      );
    }

    // Ticket
    if (_appStore.optionSelectedTicket != '') {
      if (_appStore.optionSelectedTicket == 'Todos') {
        _store.controllerGroupTicket.selectIndex(0);
      } else if (_appStore.optionSelectedTicket == 'Gratuito') {
        _store.controllerGroupTicket.selectIndex(1);
      } else if (_appStore.optionSelectedTicket == 'Pago') {
        _store.controllerGroupTicket.selectIndex(2);
      }
    }
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

      if (_appStore.optionSelectedPeriode.isNotEmpty) {
        final now = DateTime.now();
        DateTime startDate;
        DateTime endDate;

        switch (_appStore.optionSelectedPeriode) {
          case 'Hoje':
            startDate = DateTime(now.year, now.month, now.day);
            endDate = startDate; // Mesma data para hoje
            break;

          case 'Amanhã':
            startDate = DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
            endDate = startDate; // Mesma data para amanhã
            break;

          case 'Essa Semana':
            startDate = DateTime(now.year, now.month, now.day);
            endDate = startDate.add(Duration(days: 6 - now.weekday));
            break;

          case 'Próxima Semana':
            startDate = DateTime(now.year, now.month, now.day).add(Duration(days: 7 - now.weekday + 1));
            endDate = startDate.add(const Duration(days: 6));
            break;

          case 'Próximo Mês':
            startDate = DateTime(now.year, now.month + 1, 1);
            endDate = DateTime(now.year, now.month + 2, 1).subtract(const Duration(days: 1));
            break;

          default:
            return false; // Período inválido ou não tratado
        }

        // Verifica se qualquer data do evento está dentro do intervalo
        return (event.eventosdatas ?? []).any((eventDate) {
          final date = DateTime.tryParse(eventDate.datahora ?? '');
          if (date == null) return false;

          // Para hoje e amanhã, verificamos igualdade
          if (_appStore.optionSelectedPeriode == 'Hoje' || _appStore.optionSelectedPeriode == 'Amanhã') {
            return date.year == startDate.year && date.month == startDate.month && date.day == startDate.day;
          }

          // Para outros períodos, verificamos se está dentro do intervalo
          return date.isAfter(startDate.subtract(const Duration(days: 1))) &&
              date.isBefore(endDate.add(const Duration(days: 1)));
        });
      }

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

      if (_appStore.optionSelectedTicket.isNotEmpty && _appStore.optionSelectedTicket != 'Todos') {
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
