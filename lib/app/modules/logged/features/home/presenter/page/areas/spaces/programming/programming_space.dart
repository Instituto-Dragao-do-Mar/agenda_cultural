import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/search_programming/search_programming.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/programming/programming_space_app_bar.dart';

class ProgrammingSpace extends StatelessWidget {
  final Space space;
  final List<Event> events;
  final List<Space> spaces;
  final List<Category> categories;
  final List<Favorite> favorites;
  final User user;
  final void Function(bool isDetail) onConcludeFavorite;

  const ProgrammingSpace({
    super.key,
    required this.space,
    required this.spaces,
    required this.events,
    required this.categories,
    required this.favorites,
    required this.user,
    required this.onConcludeFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: ProgrammingSpaceAppBar(
        onTapSearchEvent: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchProgramming(
                events: events,
                spaces: spaces,
                categories: categories,
                favorites: favorites,
                user: user,
                onConcludeFavorite: onConcludeFavorite,
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              space.nome ?? 'Nome do Espaço',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: corTextAtual,
                fontSize: FontsApp.tamanhoBase.toDouble(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              AppLocalizations.of(context)!.e_programming,
              style: TextStyle(
                color: const Color(0Xff999999),
                fontSize: FontsApp.tamanhoBase.toDouble(),
              ),
            ),
          ),
          const SizedBox(height: 5),
          events.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    AppLocalizations.of(context)!.e_programming_default,
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: events.map(
                        (event) {
                          var eventsDate = event.eventosdatas!.first;
                          Space spaceReal = spaces.firstWhere((element) => element.id == eventsDate.idespaco);
                          Space spacePrincipal;
                          if (spaceReal.idespacoprincipal == 0) {
                            spacePrincipal = spaceReal;
                          } else {
                            spacePrincipal = spaces.firstWhere((element) => element.id == spaceReal.idespacoprincipal);
                          }

                          return ItemEventWidget(
                            event: event,
                            spacePrincipal: spacePrincipal,
                            user: user,
                            favorites: favorites,
                            onTapEvent: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDetail(
                                  event: event,
                                  spaceReal: spaceReal,
                                  spacePrincipal: spacePrincipal,
                                  categories: categories,
                                  favorites: favorites,
                                  user: user,
                                  onConcludeFavorite: () => onConcludeFavorite(true),
                                ),
                              ),
                            ),
                            onConcludeFavorite: () => onConcludeFavorite(false),
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
