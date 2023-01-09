// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/agenda/pageagenda.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/mapa/pagemapa.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../dados/dados.dart';
import '../../model/cores.dart';
import '../favorito/widgetFavoritos.dart';
import '../favorito/widgetTopoFavoritos.dart';
import '../home/widgetperfil.dart';
import '../home/widgets/widgettopoperfil.dart';

class pagePrincipal extends StatefulWidget {
  const pagePrincipal({super.key});

  @override
  State<pagePrincipal> createState() => _pagePrincipalState();
}

class _pagePrincipalState extends State<pagePrincipal> {
  int opcaoSelecionada = 0;

  List<Widget> subPaginas = [
    const widgetHome(),
    const pageAgenda(),
    const pageMapa(),
    const WidgetFavoritos(),
    const widgetPerfil(),
  ];

  List<Widget> subPaginasTopo = [
    widgetTopo(),
    pageAgendaTopo(),
    pageMapaTopo(),
    WidgetTopoFavoritos(),
    widgetTopoPerfil(),
  ];

  returnToHome() {
    setState(() {
      opcaoSelecionada = 0;
    });
  }

  Widget getAppBarWidget() {
    switch (opcaoSelecionada) {
      case 0:
        return widgetTopo(notify: returnToHome,);
      case 1:
        return pageAgendaTopo(notify: returnToHome,);
      case 2:
        return pageMapaTopo(notify: returnToHome,);
      case 3:
        return WidgetTopoFavoritos(notify: returnToHome,);
      case 4:
        return widgetTopoPerfil(notify: returnToHome,);
      default:
        return widgetTopo(notify: returnToHome,);
    }
  }

  late AppModel app;
  int? fonte;
  bool? contraste = false;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    getFonte().then((value) => fonte = value);
    getContraste().then((value) => contraste = value);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Cores.reloadColors();
    // corBgAtual = !contraste! ? Colors.white : Colors.black;
    // corAppBarAtual = !contraste! ? Colors.white : Colors.black;
    // corTextAtual = !contraste! ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: getAppBarWidget(),
      ),
      bottomNavigationBar: bottomNavi(),
      body: body(),
    );
  }

  Widget body() {
    //
    return FutureBuilder(
      future: app.getdados(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return subPaginas[opcaoSelecionada];
      },
    );
  }

  BottomNavigationBar bottomNavi() {
    return BottomNavigationBar(
      onTap: (i) {
        setState(
          () {
            opcaoSelecionada = i;
          },
        );
      },
      backgroundColor: corBgAtual,
      elevation: 0,
      showUnselectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedItemColor: corTextAtual,
      selectedItemColor: corBackgroundLaranja,
      currentIndex: opcaoSelecionada,
      items: [
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fhome.png',
            // bottomhome
          )),
          label: "Home",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fagenda.png',
            // bottomcalendario
          )),
          label: "Agenda",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fmapa.png',
            // bottommapa
          )),
          label: "Mapa",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'ffavorito.png',
            // bottomfavoritos
          )),
          label: "Favoritos",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fperfil.png',
            // bottomperfil
          )),
          label: "Perfil",
        ),
      ],
    );
  }

  Future<int> getFonte() async => await Dados.getInt('tamanhofontebase');

  Future<bool> getContraste() async => await Dados.getBool('altocontraste');

// PersistentTabView bottomNaviNovo() {
//   return PersistentTabView(
//     context,
//     navBarStyle: NavBarStyle.style6,
//     decoration: NavBarDecoration(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//     ),
//     screens: subPaginas,
//     items: [
//       PersistentBottomNavBarItem(
//         icon: widgetImagemInterna(
//             imagem: Imagem(
//           url: 'fhome.png',
//           // bottomcalendario
//         )),
//         title: ("Home"),
//         activeColorPrimary: corBackgroundLaranja,
//         inactiveColorPrimary: corTextAtual,
//       ),
//       PersistentBottomNavBarItem(
//         icon: widgetImagemInterna(
//             imagem: Imagem(
//               url: 'fagenda.png',
//               // bottomcalendario
//             )),
//         title: ("Agenda"),
//         activeColorPrimary: corBackgroundLaranja,
//         inactiveColorPrimary: corTextAtual,
//       ),
//       PersistentBottomNavBarItem(
//         icon: widgetImagemInterna(
//             imagem: Imagem(
//               url: 'fmapa.png',
//               // bottomcalendario
//             )),
//         title: ("Mapa"),
//         activeColorPrimary: corBackgroundLaranja,
//         inactiveColorPrimary: corTextAtual,
//       ),
//       PersistentBottomNavBarItem(
//         icon: widgetImagemInterna(
//             imagem: Imagem(
//               url: 'ffavorito.png',
//               // bottomcalendario
//             )),
//         title: ("Favoritos"),
//         activeColorPrimary: corBackgroundLaranja,
//         inactiveColorPrimary: corTextAtual,
//       ),
//       PersistentBottomNavBarItem(
//         icon: widgetImagemInterna(
//             imagem: Imagem(
//               url: 'fperfil.png',
//               // bottomcalendario
//             )),
//         title: ("Perfil"),
//         activeColorPrimary: corBackgroundLaranja,
//         inactiveColorPrimary: corTextAtual,
//       ),
//     ],
//   );
// }
}
