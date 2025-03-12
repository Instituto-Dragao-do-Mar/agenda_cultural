import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonFilterWidget extends StatelessWidget {
  final void Function() onTapNavigateFilter;

  const ButtonFilterWidget({
    super.key,
    required this.onTapNavigateFilter,
  });

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
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: InkWell(
              onTap: onTapNavigateFilter,
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.home_filter),
                  const SizedBox(width: 10),
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
