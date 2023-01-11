import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../dados/dados.dart';
import '../../../model/cores.dart';
import '../../../model/fontes.dart';

class widgetAcessibilidade extends StatefulWidget {
  const widgetAcessibilidade({Key? key}) : super(key: key);

  @override
  State<widgetAcessibilidade> createState() => _widgetAcessibilidadeState();
}

bool statusAltoContraste = Cores.contraste;
double fontSize = Fontes.tamanhoBase.toDouble();

class _widgetAcessibilidadeState extends State<widgetAcessibilidade> {
  int opcaoSelecionada = 0;

  var fontes = Fontes();

  List<Widget> subPaginas = [
    const widgetHome(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    widgetPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    var corBackground = statusAltoContraste ? corBgAltoContraste : corBg;
    var corAppBarLocal =
        statusAltoContraste ? corAppBarAltoContraste : corAppBar;
    var corTextLocal = statusAltoContraste ? corTextAltoContraste : corText;

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: corAppBarLocal,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
            urlImagem1: "seta.png",
            funcaoImagem1: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        color: corBackground,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Acessibilidade",
              style: Fontes.poppins18W500Black(fontSize.toInt()),
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
                  style: Fontes.roboto16W400Black(fontSize.toInt()),
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
              style: Fontes.poppins12W300Grey(fontSize.toInt()),
            ),
            const widgetEspacoH(
              altura: 23,
            ),
            Text(
              "Aumento da fonte",
              style: Fontes.roboto16W400Black(fontSize.toInt()),
            ),
            const widgetEspacoH(
              altura: 20,
            ),
            Text(
              "Aumenta o tamanho da fonte do texto para 24px facilitando a leitura.",
              style: Fontes.poppins12W300Grey(fontSize.toInt()),
            ),
            const widgetEspacoH(
              altura: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("A",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400,
                            color: !Cores.contraste
                                ? Color(0XFF000000)
                                : Colors.white,
                          ),
                        )),
                    Text(
                      "$fontSize px",
                      style: Fontes.inter16W400Grey(fontSize.toInt()),
                    )
                  ],
                ),
                IconButton(
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
              ],
            ),
            const widgetEspacoH(altura: 55),
            widgetBotao(
              text: "Voltar",
              function: () {
                Navigator.pop(context);
                /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pagePrincipal(),
                  ),
                ); */
              },
            ),
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
    // corBgAtual = !val ? Colors.white : Colors.black;
    // corAppBarAtual = !val ? Colors.white : Colors.black;
    // corTextAtual = !val ? Colors.black : Colors.white;
  }
}
