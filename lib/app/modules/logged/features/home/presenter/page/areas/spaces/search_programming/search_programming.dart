import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/search_programming/search_programming_app_bar.dart';

class SearchProgramming extends StatefulWidget {
  final List<Event> events;
  final List<Space> spaces;
  final List<Category> categories;
  final List<Favorite> favorites;
  final User user;
  final void Function(bool isDetail) onConcludeFavorite;

  const SearchProgramming({
    super.key,
    required this.events,
    required this.spaces,
    required this.categories,
    required this.favorites,
    required this.user,
    required this.onConcludeFavorite,
  });

  @override
  State<SearchProgramming> createState() => _SearchProgrammingState();
}

class _SearchProgrammingState extends State<SearchProgramming> {
  TextEditingController searchProgrammingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: const SearchProgrammingAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              AppLocalizations.of(context)!.schedule_filter_subtitle,
              style: TextStyle(
                color: corTextAtual,
                fontSize: FontsApp.tamanhoBase.toDouble(),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              controller: searchProgrammingController,
              onChanged: (value) => setState(() {}),
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
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: widget.events.where((element) {
                  return element.nome?.toUpperCase().contains(searchProgrammingController.text.toUpperCase()) ?? false;
                }).map(
                  (event) {
                    var eventsDate = event.eventosdatas!.first;
                    Space spaceReal = widget.spaces.firstWhere((element) => element.id == eventsDate.idespaco);
                    Space spacePrincipal;
                    if (spaceReal.idespacoprincipal == 0) {
                      spacePrincipal = spaceReal;
                    } else {
                      spacePrincipal = widget.spaces.firstWhere((element) => element.id == spaceReal.idespacoprincipal);
                    }

                    return ItemEventWidget(
                      event: event,
                      spacePrincipal: spacePrincipal,
                      user: widget.user,
                      favorites: widget.favorites,
                      onTapEvent: () {
                        try {
                          LogController logController = LogController();

                          logController.postLog(
                            idLogTipo: 9,
                            guidUsuario: widget.user.guidid ?? '',
                            observacao: 'Usuário '
                                '${widget.user.guidid != null ? '${widget.user.nome}' : 'não identificado'} '
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
                                categories: widget.categories,
                                favorites: widget.favorites,
                                user: widget.user,
                                onConcludeFavorite: () => widget.onConcludeFavorite(true),
                              ),
                            ),
                          );
                        }
                      },
                      onConcludeFavorite: () => widget.onConcludeFavorite(false),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
