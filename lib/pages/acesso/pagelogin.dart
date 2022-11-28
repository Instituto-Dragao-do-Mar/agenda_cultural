// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageLogin extends StatefulWidget {
  const pageLogin({super.key});

  @override
  State<pageLogin> createState() => _pageLoginState();
}

class _pageLoginState extends State<pageLogin> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, bottom: 45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Realização",
                      style: roboto16W400Black, semanticsLabel: "Realização"),
                  Image.network(
                    "logosecult.png",
                    width: 237,
                    height: 72,
                    semanticLabel: "Secult",
                  ),
                ],
              ),
              widgetEspacoH(altura: 50),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: widgetImagem(
                    width: 247,
                    height: 184,
                    imagem: Imagem(
                      url: 'logotelalogin.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              widgetEspacoH(altura: 44),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widgetBotao(
                        margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                        text: "Entrar",
                        function: () {
                          widgetErro(
                            context: context,
                            text:
                                "Funcionalidade em desenvolvimento, entre como visitante.",
                          );
                        },
                      ),
                      widgetBotao(
                        margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                        text: "Cadastre-se",
                        negative: true,
                        function: () {
                          widgetErro(
                            context: context,
                            text:
                                "Funcionalidade em desenvolvimento, entre como visitante.",
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const pagePrincipal(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                          width: double.infinity,
                          height: 65,
                          child: Center(
                            child: Text(
                              semanticsLabel: "Entrar como vivitante",
                              "Entrar como visitante",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, color: corBackground),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              widgetEspacoH(altura: 40),
              Column(
                children: [
                  Text(
                    "Gestão",
                    semanticsLabel: "Gestão",
                    style: roboto16W400Black,
                  ),
                  const widgetEspacoH(altura: 11),
                  Image.network(
                    "dragaodomar.png",
                    width: 121,
                    height: 42,
                    semanticLabel: "Centro Cultural Dragao do Mar",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
