import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/constantes.dart';

class DialogAcceptCookies extends StatelessWidget {
  final void Function() onRecuse;
  final void Function() onAccept;

  const DialogAcceptCookies({
    super.key,
    required this.onRecuse,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.int_cookies_title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(
                  'imagens/icon_cookies.svg',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.int_cookies_subtitle,
              semanticsLabel: AppLocalizations.of(context)!.int_cookies_subtitle,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff999999)),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: onRecuse,
                    child: Container(
                      width: 164,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: corBackgroundLaranja, width: 3),
                      ),
                      child: Center(
                        child: Text(
                          semanticsLabel: AppLocalizations.of(context)!.int_cookies_button_decline,
                          AppLocalizations.of(context)!.int_cookies_button_decline,
                          style: GoogleFonts.roboto(fontSize: 24, color: corBackgroundLaranja),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: onAccept,
                    child: Container(
                      width: 164,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: gradientPrincipal,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: corBackgroundLaranja, width: 3),
                      ),
                      child: Center(
                        child: Text(
                          semanticsLabel: AppLocalizations.of(context)!.int_cookies_button_accept,
                          AppLocalizations.of(context)!.int_cookies_button_accept,
                          style: GoogleFonts.roboto(fontSize: 24, color: corBg),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
