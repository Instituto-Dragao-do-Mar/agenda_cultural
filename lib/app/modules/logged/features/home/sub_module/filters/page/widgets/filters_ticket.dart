import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class FiltersTicketWidget extends StatelessWidget {
  final GroupButtonOptions optionsComponent;
  final List<String> options;
  final GroupButtonController controllerGroupTicket;
  final void Function(String, int, bool) onSelected;

  const FiltersTicketWidget({
    super.key,
    required this.optionsComponent,
    required this.options,
    required this.controllerGroupTicket,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_ticket,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
        ),
        const SizedBox(height: 5),
        GroupButton(
          options: optionsComponent,
          isRadio: true,
          controller: controllerGroupTicket,
          buttons: options,
          onSelected: onSelected,
        ),
      ],
    );
  }
}
