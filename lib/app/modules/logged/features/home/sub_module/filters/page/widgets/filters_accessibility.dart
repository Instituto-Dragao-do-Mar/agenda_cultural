import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class FiltersAccessibilityWidget extends StatelessWidget {
  final GroupButtonOptions optionsComponent;
  final List<String> options;
  final GroupButtonController controllerGroupAccessibility;
  final void Function(String, int, bool) onSelected;

  const FiltersAccessibilityWidget({
    super.key,
    required this.optionsComponent,
    required this.options,
    required this.controllerGroupAccessibility,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_accessibility,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
        ),
        const SizedBox(height: 5),
        GroupButton(
          options: optionsComponent,
          isRadio: true,
          controller: controllerGroupAccessibility,
          buttons: options,
          onSelected: onSelected,
        ),
      ],
    );
  }
}

// void processaOpcoes() {
//   opcoes = [];
//   if (widget.espacos.isNotEmpty) {
//     for (Space e in widget.espacos) {
//       if (e.acessibilidadeFisica != null && e.acessibilidadeFisica!.isNotEmpty) {
//         for (String s in e.acessibilidadeFisica!.split(';')) {
//           if (!opcoes.any((element) => element == s)) {
//             opcoes.add(s);
//           }
//         }
//       }
//     }
//   }
// }

// void traduzOpcoes() {
//   for (String acessibilidade in opcoes) {
//     String acessTrad = getNomeAcessib(acessibilidade, context);
//     acessibTrad.add(acessTrad);
//   }
//   if (!expandido) {
//     if (acessibTrad.length > 4) {
//       acessibTrad.removeRange(3, acessibTrad.length);
//       acessibTrad.add('Ver mais');
//     }
//   } else {
//     acessibTrad.removeRange(0, 4);
//     acessibTrad.add('Ver menos');
//   }
// }
