import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event_dates.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/item/item_space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';

class AreaSpacesWidget extends StatelessWidget {
  final ScrollController scrollControllerSpaces;
  final List<Space> spacesFiltered;
  final List<Event> events;
  final List<Space> spaces;
  final List<Category> categories;
  final List<Favorite> favorites;
  final bool showAllSpaces;
  final User user;
  final void Function() onTapExpandSpaces;
  final void Function(bool isDetail) onConcludeFavorite;

  const AreaSpacesWidget({
    super.key,
    required this.scrollControllerSpaces,
    required this.spacesFiltered,
    required this.spaces,
    required this.events,
    required this.categories,
    required this.favorites,
    required this.showAllSpaces,
    required this.user,
    required this.onTapExpandSpaces,
    required this.onConcludeFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        HeaderCardsWidget(
          title: AppLocalizations.of(context)!.home_spaces_title,
          subtitle: showAllSpaces
              ? AppLocalizations.of(context)!.home_spaces_less
              : AppLocalizations.of(context)!.home_spaces_all,
          onTap: onTapExpandSpaces,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: showAllSpaces ? 286 : 286 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
          child: SingleChildScrollView(
            scrollDirection: showAllSpaces ? Axis.vertical : Axis.horizontal,
            controller: scrollControllerSpaces,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: spacesFiltered.map((space) {
                List<Event> eventsProgramming = [];

                for (Event event in events) {
                  EventDates eventsDate = event.eventosdatas!.first;
                  Space spaceReal = spaces.firstWhere((element) => element.id == eventsDate.idespaco);
                  Space spacePrincipal;
                  if (spaceReal.idespacoprincipal == 0) {
                    spacePrincipal = spaceReal;
                  } else {
                    spacePrincipal = spaces.firstWhere((element) => element.id == spaceReal.idespacoprincipal);
                  }

                  if (spacePrincipal.id == space.id) {
                    eventsProgramming.add(event);
                  }
                }

                return ItemSpaceWidget(
                  space: space,
                  onTapSpace: () {
                    try {
                      LogController logController = LogController();

                      logController.postLog(
                        idLogTipo: 10,
                        guidUsuario: user.guidid ?? '',
                        observacao: 'Usuário ${user.guidid != null ? '${user.nome}' : 'não identificado'} '
                            'acessou o espaço ${space.id}',
                      );
                    } finally {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpaceDetail(
                            space: space,
                            events: events,
                            spaces: spaces,
                            categories: categories,
                            favorites: favorites,
                            user: user,
                            eventsProgramming: eventsProgramming,
                            onConcludeFavorite: onConcludeFavorite,
                          ),
                        ),
                      );
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
