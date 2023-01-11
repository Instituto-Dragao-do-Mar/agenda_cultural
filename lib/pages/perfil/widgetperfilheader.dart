// ignore_for_file: camel_case_types

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/pages/perfil/widgetperfilacessibilidade.dart';
import 'package:agendacultural/pages/home/widgetdadoscadastrais.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetidiomas.dart';
import 'package:agendacultural/pages/home/widgetnotificacoes.dart';
import 'package:agendacultural/pages/home/widgets/widgetopcaoperfil.dart';
import 'package:agendacultural/pages/perfil/widgettopoperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoPerfil(),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: widgetImagemInterna(
            imagem: Imagem(url: 'seta.png'),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (i) {
      //     setState(() {
      //       opcaoSelecionada = i;
      //     });
      //   },
      //   backgroundColor: corBgAtual,
      //   elevation: 0,
      //   showUnselectedLabels: true,
      //   unselectedFontSize: 12,
      //   selectedFontSize: 12,
      //   unselectedItemColor: Colors.black,
      //   selectedItemColor: Colors.grey,
      //   currentIndex: opcaoSelecionada,
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: corBgAtual,
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fhome.png',
      //       )),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: corBgAtual,
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fagenda.png',
      //       )),
      //       label: "Agenda",
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: corBgAtual,
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fmapa.png',
      //       )),
      //       label: "Mapa",
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: corBgAtual,
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'ffavorito.png',
      //       )),
      //       label: "Favoritos",
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: corBgAtual,
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fperfil.png',
      //       )),
      //       label: "Perfil",
      //     ),
      //   ],
      // ),
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
            widgetopacaoperfil(
              subtitulo: "Notificações e alertas",
              paginaDestino: widgetNotificacoes(),
            ),
            const widgetEspacoH(altura: 16),
            widgetopacaoperfil(
              subtitulo: "Dados cadastrais",
              paginaDestino: widgetDadosCadastrais(),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              'Geral',
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            widgetopacaoperfil(
              subtitulo: "Termos e Serviços",
              funcao: () async {
                var uri = Uri.parse("https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos");
                if(await canLaunchUrl(uri)){
                  // await launchUrl(uri, mode: LaunchMode.externalApplication);
                  await launchUrl(uri, mode: LaunchMode.platformDefault);
                }else {
                  throw 'Could not launch $uri';
                }
              },
            ),
            const widgetEspacoH(altura: 16),
            widgetopacaoperfil(
              subtitulo: "Ajuda",
              paginaDestino: widgetEmConstrucao(),
            ),
            const widgetEspacoH(altura: 16),
            widgetopacaoperfil(
              subtitulo: "Sobre o app",
              paginaDestino: widgetEmConstrucao(),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              'Acessibilidade',
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            widgetopacaoperfil(
              subtitulo: "Recursos",
              paginaDestino: widgetPerfilAcessibilidade(),
            ),
            const widgetEspacoH(altura: 16),
            widgetopacaoperfil(
              subtitulo: "Idioma",
              paginaDestino: widgetIdiomas(),
            ),
          ],
        ),
      ),
    );
  }
}
