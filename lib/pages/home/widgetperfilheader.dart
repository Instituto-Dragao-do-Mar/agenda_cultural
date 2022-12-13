import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgetperfilacessibilidade.dart';
import 'package:agendacultural/pages/home/widgetdadoscadastrais.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetindiomas.dart';
import 'package:agendacultural/pages/home/widgetnotificacoes.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgets/widgettopoperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

import '../../model/fontes.dart';
import '../../shared/constantes.dart';
import 'widgets/widgetopcaoperfil.dart';

class widgetPerfilHeader extends StatefulWidget {
  const widgetPerfilHeader({super.key});

  @override
  State<widgetPerfilHeader> createState() => _widgetPerfilHeaderState();
}

class _widgetPerfilHeaderState extends State<widgetPerfilHeader> {
  int opcaoSelecionada = 0;

  List<Widget> subPaginas = [
    const widgetHome(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    widgetPerfil(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      minimum: const EdgeInsets.symmetric(vertical: 16),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: corBackgroundNegative,
          elevation: 0,
          leadingWidth: 0,
          title: const widgetTopoPerfil(),
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
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conta",
                style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(altura: 12),
              const widgetopacaoperfil(
                subtitulo: "Notificações e alertas",
                paginaDestino: widgetNotificacoes(),
              ),
              const widgetEspacoH(altura: 16),
              const widgetopacaoperfil(
                subtitulo: "Dados cadastrais",
                paginaDestino: widgetDadosCadastrais(),
              ),
              const widgetEspacoH(altura: 24),
              Text(
                'Geral',
                style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(altura: 12),
              const widgetopacaoperfil(
                subtitulo: "Termos e Serviços",
                paginaDestino: widgetEmConstrucao(),
              ),
              const widgetEspacoH(altura: 16),
              const widgetopacaoperfil(
                subtitulo: "Ajuda",
                paginaDestino: widgetEmConstrucao(),
              ),
              const widgetEspacoH(altura: 16),
              const widgetopacaoperfil(
                subtitulo: "Sobre o app",
                paginaDestino: widgetEmConstrucao(),
              ),
              const widgetEspacoH(altura: 24),
              Text(
                'Acessibilidade',
                style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(altura: 12),
              const widgetopacaoperfil(
                subtitulo: "Recursos",
                paginaDestino: widgetPerfilAcessibilidade(),
              ),
              const widgetEspacoH(altura: 16),
              const widgetopacaoperfil(
                subtitulo: "Idioma",
                paginaDestino: widgetIndiomas(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
