import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonFilterWidget extends StatelessWidget {
  const ButtonFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FiltroCompletoPage(),
                ),
              ),
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.home_filter),
                  const SizedBox(width: 5),
                  SvgPicture.asset('imagens/filter.svg'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}