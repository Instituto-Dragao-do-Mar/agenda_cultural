import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/item/item_space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';

class AreaSpacesWidget extends StatelessWidget {
  final ScrollController scrollControllerSpaces;
  final List<Space> spaces;
  final bool showAllSpaces;
  final User user;
  final void Function() onTapExpandSpaces;

  const AreaSpacesWidget({
    super.key,
    required this.scrollControllerSpaces,
    required this.spaces,
    required this.showAllSpaces,
    required this.user,
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
          height: showAllSpaces ? 286 : 286 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
          child: SingleChildScrollView(
            scrollDirection: showAllSpaces ? Axis.vertical : Axis.horizontal,
            controller: scrollControllerSpaces,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: spaces.map((space) {
                return ItemSpaceWidget(
                  space: space,
                  onTapSpace: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpaceDetail(space: space, user: user),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
