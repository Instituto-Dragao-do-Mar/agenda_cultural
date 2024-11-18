import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_acessibility.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_app_bar.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_categories.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_dates.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_description.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_evaluation.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_image.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_link_entry.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_map.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_more_info.dart';

class EventDetail extends StatelessWidget {
  final Evento evento;
  final Espaco spaceReal;
  final Espaco spacePrincipal;
  final List<Categoria> categories;

  const EventDetail({
    super.key,
    required this.evento,
    required this.spaceReal,
    required this.spacePrincipal,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    void openNotificationError() {
      notifyPopUpWidget(context: context, textDescritivo: 'Erro ao abrir o link');
    }

    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: const EventDetailAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventDetailImageWidget(
                  urlImage: evento.eventosimagens!.first.imagens!.first.url!,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventDetailCategories(
                        event: evento,
                        categories: categories,
                      ),
                      const SizedBox(height: 5),
                      TextContrasteFonte(
                        text: evento.nome,
                        style: GoogleFonts.inter(
                          fontSize: Fontes.tamanhoBase.toDouble(),
                          fontWeight: FontWeight.w600,
                          color: corTextAtual,
                        ),
                      ),
                      if (evento.eventosdatas!.length > 1) const SizedBox(height: 7),
                      EventDetailDatesWidget(
                        event: evento,
                      ),
                      if (evento.eventosdatas!.length > 1) const SizedBox(height: 7),
                      EventDetailDescriptionWidget(
                        description: evento.detalhe ?? '',
                      ),
                      const SizedBox(height: 10),
                      EventDetailLocation(
                        spacePrincipal: spacePrincipal,
                      ),
                      const SizedBox(height: 10),
                      EventDetailMapWidget(
                        spaceReal: spaceReal,
                        event: evento,
                      ),
                      const SizedBox(height: 10),
                      EventDetailAccessibilityWidget(
                        accessibility: spaceReal.acessibilidadeFisica ?? '',
                      ),
                      const SizedBox(height: 10),
                      EventDetailMoreInfoWidget(
                        price: evento.eventosdatas?.first.preco ?? '',
                        ageRating: evento.classificacaoetaria ?? '',
                      ),
                      const SizedBox(height: 10),
                      EventDetailEvaluationWidget(
                        evento: evento,
                      ),
                      evento.urlentrada != '' ? const SizedBox(height: 80) : const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (evento.urlentrada != '')
            EventDetailLinkEntry(
              onTap: () async {
                try {
                  await launchUrlString(evento.urlentrada ?? '');
                } catch (e) {
                  openNotificationError();
                }
              },
            ),
        ],
      ),
    );
  }
}
