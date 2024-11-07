// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/perfil/perfil_idioma.page.dart';
import 'package:agendacultural/pages/perfil/widgetperfilacessibilidade.dart';
import 'package:agendacultural/pages/home/widgetdadoscadastrais.dart';
import 'package:agendacultural/pages/home/general/widgetSobre.dart';
import 'package:agendacultural/pages/home/general/widgetopcaoperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: Container(
        color: corBgAtual,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.profile_account,
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: AppLocalizations.of(context)!.profile_account_data,
                funcao: () async {
                  if (!app!.isLog()) {
                    notifyPopUpWidget(
                        context: context,
                        permitirFechar: true,
                        textDescritivo: AppLocalizations.of(context)!
                            .profile_account_data_alert,
                        textBotao: AppLocalizations.of(context)!
                            .profile_account_data_alert_accept,
                        funcaoBotao: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const pageLogin(),
                            ),
                          );
                        });
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
              AppLocalizations.of(context)!.profile_general,
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Semantics(
                container: true,
                child: widgetopacaoperfil(
                  subtitulo:
                      AppLocalizations.of(context)!.profile_general_terms,
                  funcao: () async {
                    notifyPopUpWidget(
                      context: context,
                      permitirFechar: true,
                      textDescritivo:
                          AppLocalizations.of(context)!.profile_general_alert,
                      textBotao: AppLocalizations.of(context)!
                          .profile_general_alert_accept,
                      funcaoBotao: () async {
                        var uri = Uri.parse(
                            'https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.platformDefault);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Semantics(
                container: true,
                child: widgetopacaoperfil(
                  subtitulo: AppLocalizations.of(context)!.profile_general_help,
                  funcao: () async {
                    notifyPopUpWidget(
                      context: context,
                      permitirFechar: true,
                      textDescritivo:
                          AppLocalizations.of(context)!.profile_general_alert,
                      textBotao: AppLocalizations.of(context)!
                          .profile_general_alert_accept,
                      funcaoBotao: () async {
                        var uri = Uri.parse(
                            'https://grupo-manual.gitbook.io/app-cultura.ce/ajuda');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.platformDefault);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widgetopacaoperfil(
                subtitulo: AppLocalizations.of(context)!.profile_general_upon,
                paginaDestino: const WidgetSobre(),
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Semantics(
                container: true,
                child: widgetopacaoperfil(
                  subtitulo:
                      AppLocalizations.of(context)!.profile_general_evaluate,
                  funcao: () async {
                    notifyPopUpWidget(
                      context: context,
                      permitirFechar: true,
                      textDescritivo:
                          AppLocalizations.of(context)!.profile_general_alert,
                      textBotao: AppLocalizations.of(context)!
                          .profile_general_alert_accept,
                      funcaoBotao: () async {
                        var uri =
                            Uri.parse('https://forms.gle/xzducZWvrhDsWeKt6');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri,
                              mode: LaunchMode.platformDefault);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              AppLocalizations.of(context)!.profile_accessibility,
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Semantics(
                container: false,
                label: "Recursos de acessibilidade",
                child: widgetopacaoperfil(
                  subtitulo: AppLocalizations.of(context)!
                      .profile_accessibility_resources,
                  funcao: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const widgetPerfilAcessibilidade(),
                      ),
                    ).then((value) => setState(() {}));
                  },
                ),
              ),
            ),
            const widgetEspacoH(altura: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Semantics(
                container: false,
                label: "Recursos de idioma",
                child: widgetopacaoperfil(
                  subtitulo: AppLocalizations.of(context)!.profile_language,
                  funcao: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PerfilIdiomaPage(),
                      ),
                    ).then((value) => setState(() {}));
                  },
                ),
              ),
            ),
            const widgetEspacoH(altura: 16),
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
          label: AppLocalizations.of(context)!.nav_bar_home,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fagenda.png',
            // bottomcalendario
          )),
          label: AppLocalizations.of(context)!.nav_bar_schedule,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fmapa.png',
            // bottommapa
          )),
          label: AppLocalizations.of(context)!.nav_bar_map,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'ffavorito.png',
            // bottomfavoritos
          )),
          label: AppLocalizations.of(context)!.nav_bar_favorites,
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fperfil.png',
            // bottomperfil
          )),
          label: AppLocalizations.of(context)!.nav_bar_profile,
        ),
      ],
    );
  }
}
