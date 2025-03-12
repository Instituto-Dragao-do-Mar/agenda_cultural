import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/event_controller.dart';

class ButtonFavoriteWidget extends StatefulWidget {
  final Event event;
  final bool isCardEvent;
  final User user;
  final List<Favorite> favorites;
  final void Function()? onConcludeFavorite;

  const ButtonFavoriteWidget({
    super.key,
    required this.event,
    this.isCardEvent = false,
    required this.user,
    required this.favorites,
    this.onConcludeFavorite,
  });

  @override
  State<ButtonFavoriteWidget> createState() => _ButtonFavoriteWidgetState();
}

class _ButtonFavoriteWidgetState extends State<ButtonFavoriteWidget> {
  int isFavorite = 0;

  @override
  void initState() {
    if (!mounted) super.initState();
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
            EventController eventController = EventController();
            LogController logController = LogController();

            if (widget.user.guidid == null) {
              notifyPopUpWidget(
                context: context,
                enablePop: true,
                description: AppLocalizations.of(context)!.e_alert_favorite,
                labelButton: AppLocalizations.of(context)!.profile_general_alert_accept,
                functionButton: () => Modular.to.navigate(RouterApp.auth),
              );
              return;
            }

            var isFavorited = await eventController.postFavorited(
              userGuidId: widget.user.guidid ?? '',
              token: widget.user.signature ?? '',
              idEvent: widget.event.id ?? 0,
              active: isFavorite,
            );

            await logController.postLog(
              idLogTipo: 6,
              guidUsuario: widget.user.guidid ?? '',
              observacao: 'Evento ${widget.event.id} ${isFavorite == 1 ? 'removido dos ' : 'adicionado aos '}'
                  'favoritos ${widget.user.guidid != null ? 'do usuário ${widget.user.nome}' : 'de usuário não '
                      'autenticado'}',
            );

            if (isFavorited) {
              setState(() => isFavorite = isFavorite == 1 ? 0 : 1);
            }

            widget.onConcludeFavorite != null ? widget.onConcludeFavorite!() : null;
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
