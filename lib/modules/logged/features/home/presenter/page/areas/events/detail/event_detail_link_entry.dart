import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';

class EventDetailLinkEntry extends StatelessWidget {
  final void Function() onTap;

  const EventDetailLinkEntry({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: widgetBotao(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        text: AppLocalizations.of(context)!.e_ticket,
        function: () => notifyPopUpWidget(
          context: context,
          permitirFechar: true,
          textDescritivo: AppLocalizations.of(context)!.profile_general_alert,
          textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
          funcaoBotao: onTap,
        ),
      ),
    );
  }
}
