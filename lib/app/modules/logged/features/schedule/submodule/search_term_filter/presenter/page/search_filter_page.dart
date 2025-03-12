import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/submodule/search_term_filter/presenter/page/widgets/app_bar_search_filter.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/submodule/search_term_filter/presenter/handler/search_filter_state_handler.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  final SearchFilterPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (_handler.store.isLoading) {
        return Center(
          child: CircularProgressIndicator(color: corBackgroundLaranja),
        );
      }
      return PopScope(
        canPop: false,
        onPopInvoked: (_) => Modular.to.navigate(RouterApp.logged),
        child: Scaffold(
          backgroundColor: corBgAtual,
          appBar: AppBar(
            title: const AppBarSearchFilter(),
            backgroundColor: corBgAtual,
            surfaceTintColor: corBgAtual,
            elevation: 0,
            titleSpacing: 0,
            leadingWidth: 0,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 8),
                child: Text(
                  AppLocalizations.of(context)!.schedule_filter_subtitle,
                  style: TextStyle(
                    color: corTextAtual,
                    fontSize: FontsApp.tamanhoBase.toDouble(),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: _handler.store.searchController,
                        style: FontsApp.poppins14W400Grey(FontsApp.tamanhoBase),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.schedule_filter_subtitle,
                          hintStyle: FontsApp.poppins14W400Grey(FontsApp.tamanhoBase),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          prefixIcon: Icon(Icons.search, color: corBackgroundLaranja),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: _handler.store.eventsFilter.map(
                      (event) {
                        var eventsDate = event.eventosdatas!.first;
                        Space spaceReal = _handler.appStore.spaces.firstWhere((element) {
                          return element.id == eventsDate.idespaco;
                        });
                        Space spacePrincipal;
                        if (spaceReal.idespacoprincipal == 0) {
                          spacePrincipal = spaceReal;
                        } else {
                          spacePrincipal = _handler.appStore.spaces.firstWhere((element) {
                            return element.id == spaceReal.idespacoprincipal;
                          });
                        }

                        return Container(
                          margin: EdgeInsets.only(bottom: event == _handler.store.eventsFilter.last ? 20 : 0),
                          child: ItemEventWidget(
                            event: event,
                            spacePrincipal: spacePrincipal,
                            user: _handler.appStore.userLogged,
                            favorites: _handler.appStore.favorites,
                            onTapEvent: () {
                              try {
                                LogController logController = LogController();
                                User user = _handler.appStore.userLogged;

                                logController.postLog(
                                  idLogTipo: 9,
                                  guidUsuario: user.guidid ?? '',
                                  observacao: 'Usuário ${user.guidid != null ? '${user.nome}' : 'não identificado'} '
                                      'acessou o evento ${event.id}',
                                );
                              } finally {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetail(
                                      event: event,
                                      spaceReal: spaceReal,
                                      spacePrincipal: spacePrincipal,
                                      categories: _handler.appStore.categories,
                                      favorites: _handler.appStore.favorites,
                                      user: _handler.appStore.userLogged,
                                      onConcludeFavorite: () => _handler.uploadDataFavorites(true),
                                    ),
                                  ),
                                );
                              }
                            },
                            onConcludeFavorite: () => _handler.uploadDataFavorites(false),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
