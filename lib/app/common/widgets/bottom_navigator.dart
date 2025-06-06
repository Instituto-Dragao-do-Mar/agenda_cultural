import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';

class BottomNavigator extends StatefulWidget {
  final num? replacePage;

  const BottomNavigator({
    super.key,
    this.replacePage,
  });

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HttpClient>(context);

    return BottomNavigationBar(
      onTap: (i) {
        // baseController.setBottomBarSelectedOption(i);
        // if (widget.replacePage != null) {
        //   for (int i = 0; i < (widget.replacePage! - 1); i++) {
        //     Navigator.of(context).pop();
        //   }
        // }
        // Navigator.of(context).pop();
      },
      backgroundColor: corBgAtual,
      elevation: 0,
      showUnselectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedItemColor: corTextAtual,
      selectedItemColor: corBackgroundLaranja,
      // currentIndex: baseController.bottomBarSelectedOption,
      items: [
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset(
            'imagens/nav_home.svg',
          ),
          label: AppLocalizations.of(context)!.nav_bar_home,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset(
            'imagens/nav_schedule.svg',
          ),
          label: AppLocalizations.of(context)!.nav_bar_schedule,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset(
            'imagens/nav_map.svg',
          ),
          label: AppLocalizations.of(context)!.nav_bar_map,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset(
            'imagens/nav_favorite.svg',
          ),
          label: AppLocalizations.of(context)!.nav_bar_favorites,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset(
            'imagens/nav_profile.svg',
          ),
          label: AppLocalizations.of(context)!.nav_bar_profile,
        ),
      ],
    );
  }
}
