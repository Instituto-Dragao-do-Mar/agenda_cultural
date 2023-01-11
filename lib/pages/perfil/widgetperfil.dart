// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/perfil/widgetperfilacessibilidade.dart';
import 'package:agendacultural/pages/home/widgetdadoscadastrais.dart';
import 'package:agendacultural/pages/home/widgets/widgetSobre.dart';
import 'package:agendacultural/pages/home/widgets/widgetopcaoperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetConfirma.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class widgetPerfil extends StatefulWidget {
  const widgetPerfil({super.key});

  @override
  State<widgetPerfil> createState() => _widgetPerfilState();
}

class _widgetPerfilState extends State<widgetPerfil> {
  var opcaoSelecionada = 0;
  AppModel? app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      // bottomNavigationBar: bottomNavi(),
      body: Container(
        color: corBgAtual,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Conta",
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            // const widgetopacaoperfil(
            //   subtitulo: "Notificações e alertas",
            //   paginaDestino: widgetNotificacoes(),
            // ),
            // const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: "Dados cadastrais",
                funcao: () async {
                  if (!app!.isLog()) {
                    widgetConfirma(
                      context: context,
                      cancelar: true,
                      descricao: 'Para exibir seus dados é preciso estar logado '
                          'no aplicativo. Gostaria de ir para a página de login?',
                      funcaoSim: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const pageLogin(),
                          ),
                        );
                      },
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const widgetDadosCadastrais(),
                      ),
                    );
                  }
                },
              ),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              'Geral',
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: "Termos e Serviços",
                funcao: () async {
                  var uri = Uri.parse(
                      "https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos");
                  if (await canLaunchUrl(uri)) {
                    //await launchUrl(uri, mode: LaunchMode.externalApplication);
                    await launchUrl(uri, mode: LaunchMode.platformDefault);
                  } else {
                    throw 'Could not launch $uri';
                  }
                },
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: "Ajuda",
                funcao: () async {
                  var uri = Uri.parse(
                      "https://grupo-manual.gitbook.io/app-cultura.ce/ajuda");
                  if (await canLaunchUrl(uri)) {
                    //await launchUrl(uri, mode: LaunchMode.externalApplication);
                    await launchUrl(uri, mode: LaunchMode.platformDefault);
                  } else {
                    throw 'Could not launch $uri';
                  }
                },
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: "Sobre o app",
                paginaDestino: WidgetSobre(),
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: "Avalie o app",
                funcao: () async {
                  var uri = Uri.parse(
                      "https://forms.gle/xzducZWvrhDsWeKt6");
                  if (await canLaunchUrl(uri)) {
                    //await launchUrl(uri, mode: LaunchMode.externalApplication);
                    await launchUrl(uri, mode: LaunchMode.platformDefault);
                  } else {
                    throw 'Could not launch $uri';
                  }
                },
              ),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              'Acessibilidade',
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: "Recursos",
                funcao: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const widgetPerfilAcessibilidade(),
                    ),
                  ).then((value) => setState(() {}));
                },
              ),
            ),
            const widgetEspacoH(altura: 16),
            // const widgetopacaoperfil(
            //   subtitulo: "Idioma",
            //   paginaDestino: widgetIdiomas(),
            // ),
          ],
        ),
      ),
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
}
