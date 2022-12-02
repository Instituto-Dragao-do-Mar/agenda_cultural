import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/pages/home/widgets/widgettopoperfil.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class widgetAcessibilidade extends StatefulWidget {
  const widgetAcessibilidade({Key? key}) : super(key: key);

  @override
  State<widgetAcessibilidade> createState() => _widgetAcessibilidadeState();
}

bool status = false;
double fontSize = 16;

class _widgetAcessibilidadeState extends State<widgetAcessibilidade> {
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
          title: widgetTopoComum(),
        ),
        
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Acessibilidade",
                style: poppins18W500Black,
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
                    style: roboto16W400Black,
                  ),
                  widgetBotaoSwitch(value: status)
                ],
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Text(
                "O modo de alto contraste permite ao usuário inverter as cores"
                "do primeiro plano e do plano de fundo, o que geralmente ajuda o "
                "texto a se destacar melhor.",
                style: poppins12W300Grey,
              ),
              const widgetEspacoH(
                altura: 23,
              ),
              Text(
                "Aumento da fonte",
                style: roboto16W400Black,
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Text(
                "Aumenta o tamanho da fonte do texto para 24px facilitando a leitura.",
                style: poppins12W300Grey,
              ),
              const widgetEspacoH(
                altura: 31,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 40,
                    icon:    widgetImagem(
                    imagem: Imagem(
                      url: "small.png",
                    ),
                  ),
                    onPressed: () {
                      setState(() {
                        if (fontSize > 16) {
                          fontSize--;
                        }
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
                        style: inter16W400Grey,
                      )
                    ],
                  ),
                  IconButton(
                    iconSize: 40,
                    icon:    widgetImagem(
                    imagem: Imagem(
                      url: "larger.png",
                    ),
                  ),
                    onPressed: () {
                      setState(() {
                        if (fontSize < 24) {
                          fontSize++;
                        }
                      });
                    },
                  ),
                ],
              ),
              widgetEspacoH(altura: 55),
               widgetBotao(
                text: "Voltar",
                function: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pagePrincipal(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
