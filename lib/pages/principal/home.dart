// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/agenda/pageagenda.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    widgetPerfil(),
  ];

  List<Widget> subPaginasTopo = [
    const widgetTopo(),
    const pageAgendaTopo(),
    const widgetTopo(),
    const widgetTopo(),
    const widgetTopoPerfil(),
  ];

  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: app.getdados(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /*  print("Eventos: ${app.listaEventos.eventos!.length}");
          print("Categorias: ${app.listaCategoria.categorias!.length}");*/

        return SafeArea(
          bottom: true,
          top: true,
          minimum: const EdgeInsets.symmetric(vertical: 16),
          child: Scaffold(
            backgroundColor: corBackgroundNegative,
            appBar: AppBar(
                backgroundColor: corBackgroundNegative,
                elevation: 0,
                leadingWidth: 0,
                title: subPaginasTopo[opcaoSelecionada]),
            bottomNavigationBar: bottomNavi(),
            body: subPaginas[opcaoSelecionada],
          ),
        );
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
      backgroundColor: corBackgroundNegative,
      elevation: 0,
      showUnselectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.grey,
      currentIndex: opcaoSelecionada,
      items: [
        BottomNavigationBarItem(
          backgroundColor: corBackgroundNegative,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'bottomhome.png',
          )),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'bottomcalendario.png',
          )),
          label: "Agenda",
        ),
        BottomNavigationBarItem(
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'bottommapa.png',
          )),
          label: "Mapa",
        ),
        BottomNavigationBarItem(
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'bottomfavoritos.png',
          )),
          label: "Favoritos",
        ),
        BottomNavigationBarItem(
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'bottomperfil.png',
          )),
          label: "Perfil",
        ),
      ],
    );
  }
}
