import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class TermsSignupWidget extends StatelessWidget {
  final bool isChecked;
  final void Function(bool value) setIsChecked;
  final void Function() onTapTerms;
  final void Function() onTapPrivacy;

  const TermsSignupWidget({
    super.key,
    required this.isChecked,
    required this.setIsChecked,
    required this.onTapTerms,
    required this.onTapPrivacy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Semantics(
          container: false,
          label: isChecked
              ? 'Caixa marcada, clique duas vezes para desmarcar'
              : 'Caixa desmarcada, clique duas vezes para marcar',
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: WidgetStateProperty.resolveWith(
              (states) {
                const Set<WidgetState> interactiveStates = <WidgetState>{
                  WidgetState.pressed,
                  WidgetState.hovered,
                  WidgetState.focused,
                };
                if (states.any(interactiveStates.contains)) {
                  return Colors.grey;
                }
                return corBackgroundLaranja;
              },
            ),
            value: isChecked,
            onChanged: (bool? value) => setIsChecked(value ?? false),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: FontsApp.tamanhoBase.toDouble(),
                color: const Color(0xff999999),
              ),
              children: [
                TextSpan(text: AppLocalizations.of(context)!.register_terms_one),
                const TextSpan(text: ' '),
                TextSpan(
                  text: AppLocalizations.of(context)!.register_terms_two,
                  style: TextStyle(color: corBackgroundLaranja, fontSize: FontsApp.tamanhoBase.toDouble()),
                  recognizer: TapGestureRecognizer()..onTap = onTapTerms,
                ),
                const TextSpan(text: ' '),
                TextSpan(text: AppLocalizations.of(context)!.register_terms_three),
                const TextSpan(text: ' '),
                TextSpan(
                  text: AppLocalizations.of(context)!.register_terms_four,
                  style: TextStyle(color: corBackgroundLaranja),
                  recognizer: TapGestureRecognizer()..onTap = onTapPrivacy,
                ),
                const TextSpan(text: ' '),
                TextSpan(text: AppLocalizations.of(context)!.register_terms_five),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
