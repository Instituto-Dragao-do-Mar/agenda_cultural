import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:agendacultural/model/fontes.dart';

class StepWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepWidget({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    var de = AppLocalizations.of(context)!.int_card_page_number;
    return Column(
      children: [
        StepProgressIndicator(
          totalSteps: totalSteps,
          currentStep: currentStep,
          unselectedColor: Colors.grey,
          selectedColor: const Color(0xFFE83C3B),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              label: "Página $currentStep de 3",
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: RichText(
                    text: TextSpan(
                      text: currentStep.toString(),
                      style: Fontes.inter14W500EA5B0C(Fontes.tamanhoBase),
                      children: [
                        TextSpan(
                          text: " $de 3",
                          style: Fontes.inter14W500Grey(Fontes.tamanhoBase),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}