import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

import '../model/imagem_model.dart';

class WidgetBottomNavigator extends StatefulWidget {
  int? opcaoSelecionada;
  WidgetBottomNavigator({Key? key, this.opcaoSelecionada}) : super(key: key);

  @override
  State<WidgetBottomNavigator> createState() => _WidgetBottomNavigatorState();
}

class _WidgetBottomNavigatorState extends State<WidgetBottomNavigator> {
  var opcao = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (i) {
        setState(
              () {
            widget.opcaoSelecionada = i;
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
      currentIndex: widget.opcaoSelecionada!,
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
}
