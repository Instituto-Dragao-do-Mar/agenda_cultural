import 'package:flutter/material.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
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
  final List<Evento> events;
  final List<Espaco> spaces;
  final List<Categoria> categories;
  final FilterDate? filterDateSelected;
  final bool showAllEvents;
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
    this.filterDateSelected,
    this.showAllEvents = false,
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
          secundaryComponent: exhibitionEvent == ExhibitionEvent.prominence
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
            height: showAllEvents ? 572 : 286 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
            child: SingleChildScrollView(
              scrollDirection: showAllEvents ? Axis.vertical : Axis.horizontal,
              child: Wrap(
                children: events.map((event) {
                  var eventsDate = event.eventosdatas!.first;
                  Espaco spaceReal = spaces.firstWhere((element) => element.id == eventsDate.idespaco);
                  Espaco spacePrincipal;
                  if (spaceReal.idespacoprincipal == 0) {
                    spacePrincipal = spaceReal;
                  } else {
                    spacePrincipal = spaces.firstWhere((element) => element.id == spaceReal.idespacoprincipal);
                  }

                  return ItemEventWidget(
                    evento: event,
                    spacePrincipal: spacePrincipal,
                    onTapEvent: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetail(
                          evento: event,
                          spaceReal: spaceReal,
                          spacePrincipal: spacePrincipal,
                          categories: categories,
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
