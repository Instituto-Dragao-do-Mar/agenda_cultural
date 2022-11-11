// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
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
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height / 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: widgetImagem(
                  imagem: Imagem(
                    url: './imagens/logotelalogin.png',
                  ),
                  fit: BoxFit.contain,
                  width: size.width * 0.6,
                ),
              ),
            ),
            SizedBox(              
              width: double.infinity,  
              height: size.height / 2,           
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
                            "Entrar como visitante",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: corBackground
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
