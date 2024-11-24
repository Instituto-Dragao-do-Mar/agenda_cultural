import 'package:dart_date/dart_date.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/orders.dart';
import 'package:agendacultural/app/common/utils/dates.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event_categories.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/event_controller.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/filter_date.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/store/home_store.dart';

class HomePageStateHandler {
  final AppStore _appStore;

  HomePageStateHandler(this._appStore);

  final HomeStore _store = Modular.get();

  HomeStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    _store.setIsLoading(true);
    await Future.delayed(const Duration(seconds: 1));

    if (_appStore.events.isEmpty) {
      _appStore.setEvents(await EventController().getEvents());
      await sortEvents(_appStore.events);
    }

    //Events
    filterEventsByDate(_store.filterDate, _store.setEventsDateFiltered);
    initEventsProminence();

    //Spaces
    _store.setSpacesFiltered(
      _appStore.spaces.where((space) => space.aprovado == 1).toList().take(10).toList(), // Limita a 10 espaços.
    );

    _store.setIsLoading(false);
  }

  void filterEventsByDate(FilterDate filterDate, void Function(List<Event>) setEvents) {
    String d1 = '', d2 = '';

    // Define o intervalo de datas com base no filtro selecionado.
    if (filterDate == FilterDate.thisWeek) {
      d1 = DateTime.now().toString().formatDate(format: 'yyyy-MM-dd');
      d2 = DateTime.now().endOfWeek.format('yyyy-MM-dd 23:59:59');
    } else if (filterDate == FilterDate.nextWeek) {
      d1 = DateTime.now().nextWeek.startOfWeek.toString().formatDate(format: 'yyyy-MM-dd');
      d2 = DateTime.now().nextWeek.endOfWeek.format('yyyy-MM-dd 23:59:59');
    } else if (filterDate == FilterDate.nextMonth) {
      d1 = DateTime.now().nextMonth.startOfMonth.toString().formatDate(format: 'yyyy-MM-dd');
      d2 = DateTime.now().nextMonth.endOfMonth.format('yyyy-MM-dd HH:mm:ss');
    }

    // Converte as strings para DateTime.
    DateTime dini = DateTime.parse(d1);
    DateTime dfim = DateTime.parse(d2);

    // Filtra os eventos com base no intervalo de datas e se estão aprovados.
    setEvents(
      _appStore.events.where((event) {
        bool dateInList = false;

        // Ignora eventos que não estão aprovados.
        if (event.aprovado != 1) {
          return false;
        }

        if (setEvents == _store.setEventsProminenceFiltered) {
          // Verifica se o evento está em destaque.
          if (event.destaque == 0) {
            return false;
          }
        }

        // Verifica as categorias do evento, 1 a 1.
        if (store.selectedCategory != null) {
          bool categoryMatches = false;
          for (EventCategories category in event.eventoscategorias ?? []) {
            if (category.idcategoria == _store.selectedCategory?.id) {
              categoryMatches = true;
              break; // Interrompe a verificação assim que encontra uma correspondência.
            }
          }
          if (!categoryMatches) {
            return false; // Retorna falso se nenhuma categoria corresponder.
          }
        }

        // Verifica se a data de cada evento está no intervalo definido.
        for (var d in event.eventosdatas ?? []) {
          var dataEvento = DateTime.parse(d.datahora ?? '');
          if (dataEvento.isAfter(dini) && dataEvento.isBefore(dfim)) {
            dateInList = true;
            break; // Interrompe a busca, pois um evento dentro do intervalo é suficiente.
          }
        }

        return dateInList;
      }).toList(),
    );
  }

  void initEventsProminence() {
    final eventsProminence = _appStore.events.where((event) {
      // Ignora eventos que não estão aprovados.
      if (event.aprovado != 1) {
        return false;
      }

      // Verifica se o evento está em destaque.
      return event.destaque == 1;
    }).toList();

    // Aplica o filtro com base no valor de allEventsProminence.
    _store.setEventsProminenceFiltered(
      _store.allEventsProminence
          ? eventsProminence // Mostra todos os eventos destacados.
          : eventsProminence.take(10).toList(), // Limita a 10 eventos destacados.
    );
  }

  void uploadDataFavorites(bool isDetail) async {
    if (isDetail) _store.setIsLoading(true);

    _appStore.setFavorites(
      await EventController().getFavorites(
        userGuidId: _appStore.userLogged.guidid ?? '',
        token: _appStore.userLogged.signature ?? '',
      ),
    );

    if (isDetail) _store.setIsLoading(false);
  }

  void dispose() => _store.dispose();
}
