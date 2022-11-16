// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import '../../shared/constantes.dart';

import '../home/widgetdadoscadastrais.dart';
import '../home/widgetnotificacoes.dart';
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
    widgetHome(),
    widgetEmConstrucao(),
    widgetEmConstrucao(),
    widgetEmConstrucao(),
    widgetPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
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
          title: subPaginas[opcaoSelecionada] == subPaginas[0] ? widgetTopo() : widgetTopoPerfil(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              opcaoSelecionada = i;
            });
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
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomhome.png',
              )),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomcalendario.png',
              )),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottommapa.png',
              )),
              label: "Mapa",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomfavoritos.png',
              )),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomperfil.png',
              )),
              label: "Perfil",
            ),
          ],
        ),
        body: subPaginas[opcaoSelecionada],
      ),
    );
  }
}
