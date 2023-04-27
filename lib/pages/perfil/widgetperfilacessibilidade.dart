// ignore_for_file: camel_case_types

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    const widgetHome(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    widgetPerfil(),
  ];

  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

  @override
  Widget build(BuildContext context) {
    var corBackground = statusAltoContraste ? corBgAltoContraste : corBg;
    var corAppBarLocal = statusAltoContraste ? corAppBarAltoContraste : corAppBar;
    var corTextLocal = statusAltoContraste ? corTextAltoContraste : corText;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: corAppBarLocal,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          text: "Acessibilidade",
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          semanticsLabel: "Tela de acessibilidade",
          urlImagem1: 'seta.png',
          labelImagem1: "Voltar para página anterior",
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
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fagenda.png',
      //       )),
      //       label: "Agenda",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fmapa.png',
      //       )),
      //       label: "Mapa",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'ffavorito.png',
      //       )),
      //       label: "Favoritos",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: widgetImagemInterna(
      //           imagem: Imagem(
      //         url: 'fperfil.png',
      //       )),
      //       label: "Perfil",
      //     ),
      //   ],
      // ),
      body: Container(
        color: corBackground,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Acessibilidade",
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alto contraste",
                  style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
                ),
                Semantics(
                  label: statusAltoContraste ? "Desativar alto contraste" : "Ativar alto contraste",
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
              "O modo de alto contraste permite ao usuário inverter as cores "
              "do primeiro plano e do plano de fundo, o que geralmente ajuda o "
              "texto a se destacar melhor.",
              style: Fontes.poppins12W300Grey(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 23,
            ),
            Text(
              "Alterar tamanho da fonte",
              style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 20,
            ),
            Text(
              "Aumenta o tamanho da fonte do texto para até 24px facilitando a leitura.",
              style: Fontes.poppins12W300Grey(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Semantics(
                  label: fontSize > 16 ? "Diminuir fonte para " + (fontSize - 1).toString() + " pixels" : "Fonte no tamanho mínimo, impossível diminuir",
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
                    Semantics(
                      container: true,
                      child: Text("Exemplo de texto na fonte atual",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w400,
                              color: corTextLocal,
                            ),
                          )),
                    ),
                    Text(
                      "Tamanho da fonte: $fontSize px",
                      style: Fontes.inter16W400Grey(Fontes.tamanhoBase),
                    )
                  ],
                ),
                Semantics(
                  label: fontSize < 24 ? "Aumentar fonte para " + (fontSize + 1).toString() + " pixels" : "Fonte no tamanho máximo, impossível aumentar",
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
            )
          ],
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
