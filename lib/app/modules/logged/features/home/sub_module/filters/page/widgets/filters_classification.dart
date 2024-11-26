import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class FiltersClassificationWidget extends StatelessWidget {
  final GroupButtonOptions optionsComponent;
  final List<String> options;
  final GroupButtonController controllerGroupPeriode;
  final void Function(String, int, bool) onSelected;

  const FiltersClassificationWidget({
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
          AppLocalizations.of(context)!.e_more_info_classif,
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

// void processaOpcoes() {
//   opcoes = [];
//   for (Event e in widget.eventos) {
//     if (!opcoes.any((element) => element == e.classificacaoetaria)) {
//       opcoes.add(e.classificacaoetaria!);
//     }
//   }
// }
//
// void traduzOpcoes() {
//   var an = AppLocalizations.of(context)!.e_more_info_years;
//   var fr = AppLocalizations.of(context)!.e_more_info_classif_free;
//   for (String classificacao in opcoes) {
//     String classificacaoTrad = '';
//     classificacao == 'Livre' ? classificacaoTrad = fr : classificacaoTrad.replaceAll('anos', an);
//     classifTrad.add(classificacaoTrad);
//   }
// }
