import 'package:flutter/material.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/filter_date.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/filter_date_events.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail.dart';

class AreaEventsWidget extends StatelessWidget {
  final ExhibitionEvent exhibitionEvent;
  final String title;
  final String subtitle;
  final List<Event> events;
  final List<Space> spaces;
  final List<Category> categories;
  final List<Favorite> favorites;
  final FilterDate? filterDateSelected;
  final bool showAllEvents;
  final Usuario user;
  final void Function()? onTapExpandEvents;
  final void Function(String value)? onItemSelected;

  const AreaEventsWidget({
    super.key,
    required this.exhibitionEvent,
    required this.title,
    this.subtitle = '',
    required this.events,
    required this.spaces,
    required this.categories,
    required this.favorites,
    this.filterDateSelected,
    this.showAllEvents = false,
    required this.user,
    this.onTapExpandEvents,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        HeaderCardsWidget(
          title: title,
          subtitle: subtitle,
          onTap: onTapExpandEvents ?? () {},
          secundaryComponent: exhibitionEvent == ExhibitionEvent.prominence || exhibitionEvent == ExhibitionEvent.event
              ? null
              : FilterDateWidget(
                  filterDateSelected: filterDateSelected ?? FilterDate.thisWeek,
                  onItemSelected: onItemSelected ?? (value) {},
                ),
        ),
        const SizedBox(height: 5),
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInQuad,
          child: SizedBox(
            height: showAllEvents ? 572 : 286 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
            child: SingleChildScrollView(
              scrollDirection: showAllEvents ? Axis.vertical : Axis.horizontal,
              child: Wrap(
                children: events.map((event) {
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
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
