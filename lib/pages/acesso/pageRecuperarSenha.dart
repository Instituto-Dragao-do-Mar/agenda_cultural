import 'package:agendacultural/pages/acesso/pageEntrar.dart';
import 'package:agendacultural/pages/acesso/pageNovaSenha.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:flutter/material.dart';

import '../../model/fontes.dart';
import '../../shared/constantes.dart';
import '../../shared/themes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetbotao.dart';
import '../../shared/widgetespacoh.dart';
import '../home/widgets/widgettopocomum.dart';

class PageRecuperarSenha extends StatefulWidget {
  const PageRecuperarSenha({Key? key}) : super(key: key);

  @override
  State<PageRecuperarSenha> createState() => _PageRecuperarSenhaState();
}

class _PageRecuperarSenhaState extends State<PageRecuperarSenha> {
  String emailInput = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        // leading: GestureDetector(
        //   onTap: () {
        //   },
        //   child: widgetImagemInterna(
        //     imagem: Imagem(url: 'seta.png'),
        //   ),
        // ),
        title: widgetTopoComum(
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextContrasteFonte(
                    text:
                    "Insira um email para receber o link de recuperação de senha.",
                    semantics:
                    "Insira um email para receber o link de recuperação de senha.",
                    style: Fontes.poppins12W400Grey((Fontes.tamanhoBase)),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrasteFonte(
                    text: "E-mail",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semantics: "Digite seu E-mail",
                  ),
                  TextContrasteFonte(
                    text: " *",
                    style: TextStyle(
                      color: corBackgroundLaranja,
                      fontSize: Fontes.tamanhoBase.toDouble(),
                    ),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 4,
              ),
              TextField(
                style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                onChanged: (value) {
                  setState(() {
                    emailInput = value;
                  });
                },
                decoration: textfieldDadosCadastro,
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Semantics(
                container: true,
                label: "Enviar",
                child: widgetBotao(
                  text: "Enviar",
                  function: () async => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageNovaSenha(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
