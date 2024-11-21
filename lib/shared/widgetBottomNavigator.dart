// ignore_for_file: file_names

import 'package:agendacultural/app/core/htpp_client/http_client.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/imagem_model.dart';

class WidgetBottomNavigator extends StatefulWidget {
  const WidgetBottomNavigator({
    Key? key,
    this.replacePage,
  }) : super(key: key);

  final num? replacePage;

  @override
  State<WidgetBottomNavigator> createState() => _WidgetBottomNavigatorState();
}

class _WidgetBottomNavigatorState extends State<WidgetBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    HttpClient baseController = Provider.of<HttpClient>(context);

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
