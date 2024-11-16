import 'package:flutter/material.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/modules/logged/features/home/domain/enum/filter_date.dart';
import 'package:agendacultural/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/events/item_event.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/events/filter_date_events.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';

class AreaEventsWidget extends StatelessWidget {
  final ExhibitionEvent exhibitionEvent;
  final String title;
  final String subtitle;
  final List<Evento> events;
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
                children: events.map((event) => ItemEventWidget(evento: event)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
