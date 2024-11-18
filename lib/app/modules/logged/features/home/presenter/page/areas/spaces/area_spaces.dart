import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/item_space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';

class AreaSpacesWidget extends StatelessWidget {
  final ScrollController scrollControllerSpaces;
  final List<Espaco> spaces;
  final bool showAllSpaces;
  final void Function() onTapExpandSpaces;

  const AreaSpacesWidget({
    super.key,
    required this.scrollControllerSpaces,
    required this.spaces,
    required this.showAllSpaces,
    required this.onTapExpandSpaces,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        HeaderCardsWidget(
          title: AppLocalizations.of(context)!.home_spaces_title,
          subtitle: showAllSpaces
              ? AppLocalizations.of(context)!.home_spaces_less
              : AppLocalizations.of(context)!.home_spaces_all,
          onTap: onTapExpandSpaces,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: showAllSpaces ? 532 : 266 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          child: SingleChildScrollView(
            scrollDirection: showAllSpaces ? Axis.vertical : Axis.horizontal,
            controller: scrollControllerSpaces,
            child: Wrap(
              children: spaces.map((space) => ItemSpaceWidget(space: space)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
