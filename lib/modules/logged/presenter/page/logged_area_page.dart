import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/pages/map/page/map_page.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/pages/map/widgets/app_bar_map.dart';
import 'package:agendacultural/pages/perfil/widgettopoperfil.dart';
import 'package:agendacultural/pages/favorite/page/favorite_page.dart';
import 'package:agendacultural/pages/schedule/page/schedule_page.dart';
import 'package:agendacultural/pages/home/general/app_bar_general.dart';
import 'package:agendacultural/pages/favorite/widgets/app_bar_favorite.dart';
import 'package:agendacultural/pages/schedule/widgets/app_bar_schedule.dart';
import 'package:agendacultural/modules/logged/presenter/store/logged_area_store.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/home_page.dart';

class LoggedAreaPage extends StatefulWidget {
  const LoggedAreaPage({super.key});

  @override
  State<LoggedAreaPage> createState() => _LoggedAreaPageState();
}

class _LoggedAreaPageState extends State<LoggedAreaPage> {
  final _loggedAreaStore = LoggedAreaStore();
  final List<Widget> _screens = [
    const HomePage(),
    const SchedulePage(),
    const MapPage(),
    const FavoritePage(),
    const widgetPerfil(),
  ];

  @override
  void initState() {
    initializeScreen();
    super.initState();
  }

  Future<void> initializeScreen() async => await setScreen(0);

  Future<void> setScreen(int index) async {
    _loggedAreaStore.setCurrentScreen(_screens[index]);
    _loggedAreaStore.setCurrentTab(index);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    Cores.reloadColors();

    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: corBgAtual,
          appBar: AppBar(
            title: _buildAppBar(),
            backgroundColor: corBgAtual,
            surfaceTintColor: corBgAtual,
            elevation: 0,
            titleSpacing: 0,
            leadingWidth: 0,
            automaticallyImplyLeading: false,
          ),
          body: _loggedAreaStore.isLoading ? const SizedBox.shrink() : _loggedAreaStore.currentScreen,
          bottomNavigationBar: _buildBottonNavigation(),
        );
      },
    );
  }

  Widget _buildBottonNavigation() {
    return BottomNavigationBar(
      onTap: (index) async {
        await setScreen(index);
        if (index == 0 || index == 3) {
          _loggedAreaStore.setIsLoading(true);
          await Future.delayed(const Duration(microseconds: 1));
          _loggedAreaStore.setIsLoading(false);
        }
      },
      currentIndex: _loggedAreaStore.currentTab,
      backgroundColor: corBgAtual,
      unselectedItemColor: corTextAtual,
      selectedItemColor: corBackgroundLaranja,
      elevation: 10,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/nav_home.svg'),
          label: AppLocalizations.of(context)!.nav_bar_home,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/nav_schedule.svg'),
          label: AppLocalizations.of(context)!.nav_bar_schedule,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/nav_map.svg'),
          label: AppLocalizations.of(context)!.nav_bar_map,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/nav_favorite.svg'),
          label: AppLocalizations.of(context)!.nav_bar_favorites,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/nav_profile.svg'),
          label: AppLocalizations.of(context)!.nav_bar_profile,
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    switch (_loggedAreaStore.currentTab) {
      case 0:
        return const AppBarGeneral();
      case 1:
        return AppBarScheduleWidget(onTapReturn: () => setScreen(0));
      case 2:
        return AppBarMapWidget(onTapReturn: () => setScreen(0));
      case 3:
        return AppBarFavoriteWidget(onTapReturn: () => setScreen(0));
      case 4:
        return widgetTopoPerfil(notify: () => setScreen(0));
      default:
        return const AppBarGeneral();
    }
  }
}
