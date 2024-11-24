import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';

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
      child: ButtonDefault(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        text: AppLocalizations.of(context)!.e_ticket,
        function: () => notifyPopUpWidget(
          context: context,
          enablePop: true,
          description: AppLocalizations.of(context)!.profile_general_alert,
          labelButton: AppLocalizations.of(context)!.profile_general_alert_accept,
          functionButton: onTap,
        ),
      ),
    );
  }
}
