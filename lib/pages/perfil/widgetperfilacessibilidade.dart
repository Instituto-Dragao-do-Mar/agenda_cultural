// ignore_for_file: camel_case_types, unused_local_variable

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/pages/home/home_page.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/widgetbotao.dart';

class widgetPerfilAcessibilidade extends StatefulWidget {
  const widgetPerfilAcessibilidade({Key? key}) : super(key: key);

  @override
  State<widgetPerfilAcessibilidade> createState() =>
      _widgetPerfilAcessibilidadeState();
}

bool status = false;
double fontSize = 16;

class _widgetPerfilAcessibilidadeState
    extends State<widgetPerfilAcessibilidade> {
  int opcaoSelecionada = 0;

  List<Widget> subPaginas = [
    const HomePage(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetPerfil(),
  ];

  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

  @override
  Widget build(BuildContext context) {
    var corBackground = statusAltoContraste ? corBgAltoContraste : corBg;
    var corAppBarLocal =
        statusAltoContraste ? corAppBarAltoContraste : corAppBar;
    var corTextLocal = statusAltoContraste ? corTextAltoContraste : corText;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: corAppBarLocal,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          text: AppLocalizations.of(context)!.profile_accessibility,
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          semanticsLabel: "Tela de ",
          urlImagem1: 'seta.png',
          labelImagem1: "Voltar para página anterior",
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const WidgetBottomNavigator(),
      body: SingleChildScrollView(
        child: Container(
          color: corBackground,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.profile_accessibility,
                style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Text(
                AppLocalizations.of(context)!.profile_accessibility_resume,
                style: Fontes.poppins14W300Grey(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(
                altura: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.int_first_subtitle,
                    style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
                  ),
                  Semantics(
                    label: statusAltoContraste
                        ? "Desativar alto contraste"
                        : "Ativar alto contraste",
                    child: widgetBotaoSwitch(
                      value: statusAltoContraste,
                      function: (value) {
                        setState(() {
                          statusAltoContraste = value;
                          setAltoContraste(statusAltoContraste);
                        });
                      },
                    ),
                  )
                ],
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Text(
                AppLocalizations.of(context)!.int_first_explanation,
                style: Fontes.poppins14W300Grey(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(
                altura: 23,
              ),
              Text(
                AppLocalizations.of(context)!.int_second_title,
                style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Text(
                AppLocalizations.of(context)!.int_second_example_title,
                //"Aumenta o tamanho da fonte do texto para até 24px facilitando a leitura.",
                style: Fontes.poppins14W300Grey(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.int_second_example_text,
                      semanticsLabel:
                          "Mas a terra de Oz nunca foi civilizada, porque vivemos separados do resto do mundo.Fonte atual: $fontSize pixels",
                      style: Fontes.roboto14W400Black(Fontes.tamanhoBase),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const widgetEspacoH(
                altura: 31,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    label: fontSize > 16
                        ? "Diminuir fonte para ${fontSize - 1} pixels"
                        : "Fonte no tamanho mínimo, impossível diminuir",
                    child: IconButton(
                      iconSize: 40,
                      icon: widgetImagemInterna(
                        imagem: Imagem(
                          url: "small.png",
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (fontSize > 16) {
                            fontSize--;
                          }
                          setFontSize(fontSize);
                        });
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Semantics(
                      //   container: true,
                      //   child: Text("Exemplo de texto na fonte atual",
                      //       style: GoogleFonts.inter(
                      //         textStyle: TextStyle(
                      //           fontSize: fontSize,
                      //           fontWeight: FontWeight.w400,
                      //           color: corTextLocal,
                      //         ),
                      //       )),
                      // ),
                      Text(
                        "${AppLocalizations.of(context)!.int_font_size} $fontSize px",
                        style: Fontes.inter16W400Grey(Fontes.tamanhoBase),
                      )
                    ],
                  ),
                  Semantics(
                    label: fontSize < 24
                        ? "Aumentar fonte para ${fontSize + 1} pixels"
                        : "Fonte no tamanho máximo, impossível aumentar",
                    child: IconButton(
                      iconSize: 40,
                      icon: widgetImagemInterna(
                        imagem: Imagem(
                          url: "larger.png",
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (fontSize < 24) {
                            fontSize++;
                          }
                          setFontSize(fontSize);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Semantics(
                container: false,
                label: "Botão Salvar",
                child: widgetBotao(
                  text:
                      AppLocalizations.of(context)!.profile_accessibility_save,
                  function: () async {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future setFontSize(double fontSize) async {
    Fontes.setTamanhoBase(fontSize.toInt());
    await Dados.setInt('tamanhofontebase', fontSize.toInt());
  }

  Future setAltoContraste(bool val) async {
    Cores.setAltoContraste(val);
    await Dados.setBool('altocontraste', val);
    Cores.reloadColors();
  }
}
