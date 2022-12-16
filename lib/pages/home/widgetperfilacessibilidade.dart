import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgets/widgettopoperfil.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dados/dados.dart';
import '../../model/cores.dart';
import '../../model/fontes.dart';

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
        backgroundColor: corBgAtual,
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
        backgroundColor: corBgAtual,
        elevation: 0,
        showUnselectedLabels: true,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.grey,
        currentIndex: opcaoSelecionada,
        items: [
          BottomNavigationBarItem(
            backgroundColor: corBgAtual,
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
                widgetBotaoSwitch(
                  value: statusAltoContraste,
                  function: (value) {
                    setState(() {
                      statusAltoContraste = value;
                      setAltoContraste(statusAltoContraste);
                    });
                  },
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
              "Aumento da fonte",
              style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 20,
            ),
            Text(
              "Aumenta o tamanho da fonte do texto para 24px facilitando a leitura.",
              style: Fontes.poppins12W300Grey(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 40,
                  icon: Image.network(
                    "small.png",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("A",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF000000),
                          ),
                        )),
                    Text(
                      "$fontSize px",
                      style: Fontes.inter16W400Grey(Fontes.tamanhoBase),
                    )
                  ],
                ),
                IconButton(
                  iconSize: 40,
                  icon: Image.network(
                    "larger.png",
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
  }
}
