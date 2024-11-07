import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/mapa/pagemapa.dart';
import 'package:agendacultural/pages/home/home_page.dart';
import 'package:agendacultural/pages/agenda/pageagenda.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/pages/home/general/app_bar_general.dart';
import 'package:agendacultural/pages/perfil/widgettopoperfil.dart';
import 'package:agendacultural/pages/favorito/widgetFavoritos.dart';
import 'package:agendacultural/pages/favorito/widgetTopoFavoritos.dart';

class LoggedAreaPage extends StatefulWidget {
  const LoggedAreaPage({super.key});

  @override
  State<LoggedAreaPage> createState() => _LoggedAreaPageState();
}

class _LoggedAreaPageState extends State<LoggedAreaPage> {
  late BaseController baseController;
  late AppModel app;
  int? fonte;
  bool? contraste = false;
  List<Widget> pagesBody = [
    const HomePage(),
    const pageAgenda(),
    const pageMapa(),
    const WidgetFavoritos(),
    const widgetPerfil(),
  ];
  List<Widget> pagesBodyAppBar = [
    AppBarGeneral(),
    pageAgendaTopo(),
    pageMapaTopo(),
    WidgetTopoFavoritos(),
    widgetTopoPerfil(),
  ];

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    baseController = context.read<BaseController>();

    _getFonte().then((value) => fonte = value);
    _getContraste().then((value) => contraste = value);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (app.usuarioLogado?.email == null) app.resetUser(notify: false);
    baseController = Provider.of<BaseController>(context);

    Cores.reloadColors();

    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        title: _buildAppBar(),
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: _buildBottonNavigation(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: app.getdados(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }

        return pagesBody[baseController.bottomBarSelectedOption];
      },
    );
  }

  BottomNavigationBar _buildBottonNavigation() {
    return BottomNavigationBar(
      onTap: baseController.setBottomBarSelectedOption,
      currentIndex: baseController.bottomBarSelectedOption,
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
          icon: SvgPicture.asset('imagens/navHome.svg'),
          label: AppLocalizations.of(context)!.nav_bar_home,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/navSchedule.svg'),
          label: AppLocalizations.of(context)!.nav_bar_schedule,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/navMap.svg'),
          label: AppLocalizations.of(context)!.nav_bar_map,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/navFavorite.svg'),
          label: AppLocalizations.of(context)!.nav_bar_favorites,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: SvgPicture.asset('imagens/navProfile.svg'),
          label: AppLocalizations.of(context)!.nav_bar_profile,
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    switch (baseController.bottomBarSelectedOption) {
      case 0:
        return AppBarGeneral(notify: () => baseController.setBottomBarSelectedOption(0));
      case 1:
        return pageAgendaTopo(notify: () => baseController.setBottomBarSelectedOption(0));
      case 2:
        return pageMapaTopo(notify: () => baseController.setBottomBarSelectedOption(0));
      case 3:
        return WidgetTopoFavoritos(notify: () => baseController.setBottomBarSelectedOption(0));
      case 4:
        return widgetTopoPerfil(notify: () => baseController.setBottomBarSelectedOption(0));
      default:
        return AppBarGeneral(notify: () => baseController.setBottomBarSelectedOption(0));
    }
  }

  Future<int> _getFonte() async => await Dados.getInt('tamanhofontebase');

  Future<bool> _getContraste() async => await Dados.getBool('altocontraste');
}
