import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/dates.dart';
import 'package:agendacultural/app/common/utils/capitalize.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/common/widgets/button_favorite_event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event_info.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event_image.dart';

class ItemEventWidget extends StatelessWidget {
  final Event event;
  final Space spacePrincipal;
  final List<Favorite> favorites;
  final User user;
  final void Function() onTapEvent;
  final void Function()? onConcludeFavorite;

  const ItemEventWidget({
    super.key,
    required this.event,
    required this.spacePrincipal,
    required this.onTapEvent,
    required this.favorites,
    required this.user,
    this.onConcludeFavorite,
  });

  @override
  Widget build(BuildContext context) {
    List<String> datas = event.eventosdatas!.map((e) => e.datahora!).toList();
    String diaabr = datas.first.formatDate(format: 'E').capitalize();
    String dia = datas.first.formatDate(format: 'dd').capitalize();
    String mes = datas.first.formatDate(format: 'MMM').capitalize();
    String hora = datas.first.formatDate(format: 'HH:mm').capitalize();

    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 270 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
        width: 180 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !ColorsApp.contraste ? const Color(0xFFF6F6F6) : Colors.black.withOpacity(.8),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 3, offset: const Offset(0, 0))],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemEventImageWidget(
                  urlImage: event.eventosimagens?.first.imagens?.first.url ?? '',
                ),
                ItemEventInfoWidget(
                  nameEvent: event.nome ?? 'Evento',
                  nameSpace: spacePrincipal.nome ?? 'Espaço',
                  date: '$diaabr $dia/$mes - $hora',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonFavoriteWidget(
                      event: event,
                      isCardEvent: true,
                      user: user,
                      favorites: favorites,
                      onConcludeFavorite: onConcludeFavorite,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
