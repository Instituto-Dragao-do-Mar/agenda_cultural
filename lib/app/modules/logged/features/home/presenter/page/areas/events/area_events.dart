import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
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
  final User user;
  final void Function()? onTapExpandEvents;
  final void Function(String value)? onItemSelected;
  final void Function(bool isDetail) onConcludeFavorite;

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
    required this.onConcludeFavorite,
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
          secundaryComponent: exhibitionEvent == ExhibitionEvent.prominence ||
                  exhibitionEvent == ExhibitionEvent.eventMap ||
                  exhibitionEvent == ExhibitionEvent.eventSchedule ||
                  exhibitionEvent == ExhibitionEvent.eventHome
              ? null
              : FilterDateWidget(
                  filterDateSelected: filterDateSelected ?? FilterDate.thisWeek,
                  onItemSelected: onItemSelected ?? (value) {},
                ),
        ),
        const SizedBox(height: 5),
        Expanded(
          flex: exhibitionEvent == ExhibitionEvent.eventSchedule ? 1 : 0,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInQuad,
            child: SizedBox(
              width: double.infinity,
              height: exhibitionEvent == ExhibitionEvent.prominence
                  ? showAllEvents
                      ? 572
                      : 286 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase
                  : null,
              child: SingleChildScrollView(
                scrollDirection: showAllEvents ? Axis.vertical : Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.center,
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
                            onConcludeFavorite: () => onConcludeFavorite(true),
                          ),
                        ),
                      ),
                      onConcludeFavorite: () => onConcludeFavorite(false),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
