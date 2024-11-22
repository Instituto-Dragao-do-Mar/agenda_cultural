import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_map.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_dates.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_image.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_app_bar.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_more_info.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_evaluation.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_categories.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_link_entry.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_description.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail_acessibility.dart';

class EventDetail extends StatelessWidget {
  final Event event;
  final Space spaceReal;
  final Space spacePrincipal;
  final List<Category> categories;
  final List<Favorite> favorites;
  final User user;
  final void Function() onConcludeFavorite;

  const EventDetail({
    super.key,
    required this.event,
    required this.spaceReal,
    required this.spacePrincipal,
    required this.categories,
    required this.favorites,
    required this.user,
    required this.onConcludeFavorite,
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
                  urlImage: event.eventosimagens!.first.imagens!.first.url!,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EventDetailCategories(
                        event: event,
                        categories: categories,
                      ),
                      const SizedBox(height: 5),
                      TextContrastFont(
                        text: event.nome,
                        maxlines: 3,
                        style: GoogleFonts.inter(
                          fontSize: FontsApp.tamanhoBase.toDouble(),
                          fontWeight: FontWeight.w600,
                          color: corTextAtual,
                        ),
                      ),
                      if (event.eventosdatas!.length > 1) const SizedBox(height: 7),
                      EventDetailDatesWidget(
                        event: event,
                        user: user,
                        favorites: favorites,
                        onConcludeFavorite: onConcludeFavorite,
                      ),
                      if (event.eventosdatas!.length > 1) const SizedBox(height: 7),
                      EventDetailDescriptionWidget(
                        description: event.detalhe ?? '',
                      ),
                      const SizedBox(height: 10),
                      EventDetailLocation(
                        spacePrincipal: spacePrincipal,
                      ),
                      const SizedBox(height: 10),
                      EventDetailMapWidget(
                        spaceReal: spaceReal,
                        event: event,
                      ),
                      const SizedBox(height: 10),
                      EventDetailAccessibilityWidget(
                        accessibility: spaceReal.acessibilidadeFisica ?? '',
                      ),
                      const SizedBox(height: 10),
                      EventDetailMoreInfoWidget(
                        price: event.eventosdatas?.first.preco ?? '',
                        ageRating: event.classificacaoetaria ?? '',
                      ),
                      const SizedBox(height: 10),
                      EventDetailEvaluationWidget(
                        event: event,
                        user: user,
                      ),
                      event.urlentrada != '' ? const SizedBox(height: 80) : const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (event.urlentrada != '')
            EventDetailLinkEntry(
              onTap: () async {
                try {
                  await launchUrlString(event.urlentrada ?? '');
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
