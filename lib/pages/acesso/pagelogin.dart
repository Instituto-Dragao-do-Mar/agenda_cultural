// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pageCadastro.dart';
import 'package:agendacultural/pages/acesso/pageEntrar.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/app_model.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class pageLogin extends StatefulWidget {
  const pageLogin({super.key});

  @override
  State<pageLogin> createState() => _pageLoginState();
}

class _pageLoginState extends State<pageLogin> {
  final ScrollController scrollController = ScrollController();
  AppModel? app;

  @override
  void initState() {
    app = context.read<AppModel>();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    app?.resetUser();

    return Scaffold(
      backgroundColor: corBgAtual,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, bottom: 45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextContrasteFonte(
                    text: "Realização",
                    style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
                    semantics: "Realização Governo do Estado do Ceará.",
                  ),
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: "logosecult.png",
                    ),
                    width: 237,
                    height: 72,
                  ),
                ],
              ),
              const widgetEspacoH(altura: 50),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Semantics(
                    container: true,
                    label: "Cultura c e, Agenda Cultural do Ceará",
                    child: widgetImagemInterna(
                      width: 247,
                      height: 184,
                      imagem: Imagem(
                        url: 'logotelalogindemo.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const widgetEspacoH(altura: 44),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageEntrar(),
                            ),
                          );
                        },
                      ),
                      widgetBotao(
                        margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                        text: "Cadastre-se",
                        negative: true,
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageCadastro(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
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
                            child: TextContrasteFonte(
                              text: "Entrar como visitante",
                              semantics: "Entrar como visitante",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: corBackgroundLaranja,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const widgetEspacoH(altura: 40),
              Column(
                children: [
                  TextContrasteFonte(
                    text: "Gestão",
                    semantics: "Gestão Instituto Dragão do Mar",
                    style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
                  ),
                  const widgetEspacoH(altura: 5),
                  Container(
                    width: 150,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: corBg,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: widgetImagemInterna(
                      imagem: Imagem(
                        url: "dragaodomar.png",
                      ),
                      width: 121,
                      height: 72,
                    ),
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
