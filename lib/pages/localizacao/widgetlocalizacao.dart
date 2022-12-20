import 'dart:html';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/localizacao/widgetinserirlocalizacao.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../model/fontes.dart';

class Widgetlocalizacao extends StatelessWidget {
  const Widgetlocalizacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopo(),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Onde você está?",
                  style: Fontes.poppins18W400222(Fontes.tamanhoBase),
                ),
                const widgetEspacoV(largura: 10),
                widgetImagemInterna(
                  imagem: Imagem(
                    url: "local.png",
                  ),
                ),
              ],
            ),
            const widgetEspacoH(
              altura: 17,
            ),
            Text(
              "Ao definir sua localização facilitará a busca por"
              " informações relacionadas aos eventos que estão acontecendo"
              " ao seu redor e espaços culturais da cidade!",
              style: Fontes.poppins14W400Grey(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(
              altura: 16,
            ),
            widgetBotao(
              text: "Ativar agora",
              function: () async {

                  print("000000");

                Location _location = Location();

                PermissionStatus _temPermissao =
                    await _location.hasPermission();

                if (_temPermissao == PermissionStatus.granted) {
                    print("55555");

                  await Dados.setBool('localizacao', true);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pageLogin(),
                    ),
                  );
                } else {
                  _temPermissao = await _location.requestPermission();

                  print("11111");

                  if (_temPermissao == PermissionStatus.denied) {
                      print("22222");

                    widgetMensagem(
                      context: context,
                      text: "É necessário da a permissão ao app de "
                          " obter a localização via GPS ou informar o local "
                          "manualmente.",
                    );
                    return;
                  } else {
                      print("33333");

                    await Dados.setBool('localizacao', true);
                    
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const pageLogin(),
                      ),
                    );
                  }
                }
              },
            ),
            const widgetEspacoH(
              altura: 32,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WidgetInserirLocalizacao(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                width: double.infinity,
                height: 65,
                child: Center(
                  child: Text(
                    "Inserir localização manualmente",
                    semanticsLabel: "Clique Inserir localização manualmente",
                    style: Fontes.roboto16W400EA5(Fontes.tamanhoBase),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pageLogin(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                width: double.infinity,
                height: 65,
                child: Center(
                  child: Text(
                    "Ir para login",
                    semanticsLabel: "Entrar",
                    style: Fontes.roboto16W400EA5(Fontes.tamanhoBase),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
