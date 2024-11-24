import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/dates.dart';
import 'package:agendacultural/app/common/utils/capitalize.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/common/widgets/button_favorite_event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';

class EventDetailDatesWidget extends StatelessWidget {
  final Event event;
  final User user;
  final List<Favorite> favorites;
  final void Function() onConcludeFavorite;

  const EventDetailDatesWidget({
    super.key,
    required this.event,
    required this.user,
    required this.favorites,
    required this.onConcludeFavorite,
  });

  @override
  Widget build(BuildContext context) {
    if (event.eventosdatas?.length != 1) {
      return Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  'imagens/icon_calendar.svg',
                  height: 18,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: TextContrastFont(
                    text: event.eventosdatas?.first.detalhe ?? '',
                    maxlines: 3,
                    style: GoogleFonts.inter(
                      fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Semantics(
            label: 'Botão favorito',
            child: ButtonFavoriteWidget(
              event: event,
              user: user,
              favorites: favorites,
              onConcludeFavorite: onConcludeFavorite,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: event.eventosdatas?.map(
                (e) {
                  String dayWeek = e.datahora?.formatDate(format: 'E').capitalize() ?? '';
                  String day = e.datahora?.formatDate(format: 'dd') ?? '';
                  String month = e.datahora?.formatDate(format: 'MM').capitalize() ?? '';
                  String hour = e.datahora?.formatDate(format: 'HH:mm').capitalize() ?? '';
                  String year = e.datahora?.formatDate(format: 'yyyy') ?? '';

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'imagens/icon_calendar.svg',
                        height: 18,
                      ),
                      const SizedBox(width: 4),
                      TextContrastFont(
                        text: '$dayWeek $day/$month/$year',
                        style: GoogleFonts.inter(
                          fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
                          fontWeight: FontWeight.w500,
                          color: corTextAtual,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        'imagens/icon_clock.svg',
                        height: 18,
                      ),
                      const SizedBox(width: 4),
                      TextContrastFont(
                        text: hour,
                        style: GoogleFonts.inter(
                          fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
                          fontWeight: FontWeight.w500,
                          color: corTextAtual,
                        ),
                      ),
                    ],
                  );
                },
              ).toList() ??
              [],
        ),
        Semantics(
          label: 'Botão favorito',
          child: ButtonFavoriteWidget(
            event: event,
            user: user,
            favorites: favorites,
            onConcludeFavorite: onConcludeFavorite,
          ),
        ),
      ],
    );
  }
}
