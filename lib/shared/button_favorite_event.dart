import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/event_controller.dart';

class ButtonFavoriteWidget extends StatefulWidget {
  final Event event;
  final bool isCardEvent;
  final Usuario user;
  final List<Favorite> favorites;

  const ButtonFavoriteWidget({
    super.key,
    required this.event,
    this.isCardEvent = false,
    required this.user,
    required this.favorites,
  });

  @override
  State<ButtonFavoriteWidget> createState() => _ButtonFavoriteWidgetState();
}

class _ButtonFavoriteWidgetState extends State<ButtonFavoriteWidget> {
  int isFavorite = 0;

  @override
  void initState() {
    super.initState();
    widget.favorites.map((e) => e.idevento).contains(widget.event.id) ? isFavorite = 1 : isFavorite = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: isFavorite == 1
          ? 'Remover ${widget.event.nome} dos favoritos'
          : 'Adicionar ${widget.event.nome} aos favoritos',
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: GestureDetector(
          onTap: () async {
            if (widget.user.guidid == null) {
              notifyPopUpWidget(
                context: context,
                permitirFechar: true,
                textDescritivo: AppLocalizations.of(context)!.e_alert_favorite,
                textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                funcaoBotao: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pageLogin(),
                  ),
                ),
              );
              return;
            }

            var isFavorited = await EventController().postFavorited(
              userGuidId: widget.user.guidid ?? '',
              token: widget.user.signature ?? '',
              idEvent: widget.event.id ?? 0,
              active: isFavorite,
            );

            if (isFavorited) {
              setState(() => isFavorite = isFavorite == 1 ? 0 : 1);
            }
          },
          child: Icon(
            Icons.favorite,
            color: isFavorite == 1
                ? Colors.red
                : widget.isCardEvent
                    ? Colors.white
                    : Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}
