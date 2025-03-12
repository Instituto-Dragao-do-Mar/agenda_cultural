import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class FiltersPeriodeWidget extends StatelessWidget {
  final GroupButtonOptions optionsComponent;
  final List<String> options;
  final GroupButtonController controllerGroupPeriode;
  final void Function(String, int, bool) onSelected;

  const FiltersPeriodeWidget({
    super.key,
    required this.optionsComponent,
    required this.options,
    required this.controllerGroupPeriode,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.filter_periode,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
        ),
        const SizedBox(height: 5),
        GroupButton(
          options: optionsComponent,
          isRadio: true,
          controller: controllerGroupPeriode,
          buttons: options,
          onSelected: onSelected,
        ),
      ],
    );
  }
}
