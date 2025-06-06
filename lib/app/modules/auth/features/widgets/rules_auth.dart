import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class RulesAuthWidget extends StatelessWidget {
  final int haveMinDigits;
  final int haveUpperCase;
  final int haveLowerCase;
  final int haveNumber;
  final int rulesMatch;

  const RulesAuthWidget({
    super.key,
    required this.haveMinDigits,
    required this.haveUpperCase,
    required this.haveLowerCase,
    required this.haveNumber,
    required this.rulesMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrastFont(
          text: AppLocalizations.of(context)!.register_password_order,
          style: FontsApp.roboto12W400Grey(FontsApp.tamanhoBase + 2),
          semantics: 'Sua senha deve conter:',
        ),
        const SizedBox(height: 2),
        TextContrastFont(
          text: AppLocalizations.of(context)!.register_password_order_one,
          style: haveMinDigits == 1
              ? FontsApp.roboto12W300Green(FontsApp.tamanhoBase + 2)
              : FontsApp.roboto12W300Grey(FontsApp.tamanhoBase + 2),
          semantics: 'No mínimo 6 dígitos',
        ),
        const SizedBox(height: 2),
        TextContrastFont(
          text: AppLocalizations.of(context)!.register_password_order_two,
          style: haveUpperCase == 1
              ? FontsApp.roboto12W300Green(FontsApp.tamanhoBase + 2)
              : FontsApp.roboto12W300Grey(FontsApp.tamanhoBase + 2),
          semantics: 'Pelo menos 1 letra maiúscula',
        ),
        const SizedBox(height: 2),
        TextContrastFont(
          text: AppLocalizations.of(context)!.register_password_order_three,
          style: haveLowerCase == 1
              ? FontsApp.roboto12W300Green(FontsApp.tamanhoBase + 2)
              : FontsApp.roboto12W300Grey(FontsApp.tamanhoBase + 2),
          semantics: 'Pelo menos 1 letra minúscula',
        ),
        const SizedBox(height: 2),
        TextContrastFont(
          text: AppLocalizations.of(context)!.register_password_order_four,
          style: haveNumber == 1
              ? FontsApp.roboto12W300Green(FontsApp.tamanhoBase + 2)
              : FontsApp.roboto12W300Grey(FontsApp.tamanhoBase + 2),
          semantics: 'Pelo menos 1 número',
        ),
        const SizedBox(height: 2),
        TextContrastFont(
          text: AppLocalizations.of(context)!.register_password_order_five,
          style: FontsApp.roboto12W300Grey(FontsApp.tamanhoBase + 2),
          semantics: 'Força da senha:',
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: StepProgressIndicator(
                totalSteps: 4,
                currentStep: rulesMatch,
                selectedColor: Colors.deepOrange,
                unselectedColor: Colors.grey,
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
