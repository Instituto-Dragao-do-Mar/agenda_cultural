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

class Widgetlocalizacao extends StatelessWidget {
  const Widgetlocalizacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      minimum: const EdgeInsets.symmetric(vertical: 16),
      child: Scaffold(
        backgroundColor: corBackgroundNegative,
        appBar: AppBar(
          backgroundColor: corBackgroundNegative,
          elevation: 0,
          leadingWidth: 0,
          title: const widgetTopo(),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Onde você está?",
                    style: poppins14W400222,
                  ),
                  const widgetEspacoV(largura: 10),
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: "local.png",
                    ),
                  ),
                  Expanded(child: Row()),
                  IconButton(
                    onPressed: () {},
                    icon: widgetImagemInterna(
                      imagem: Imagem(
                        url: "fechar.png",
                      ),
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
                style: poppins14W400Grey,
              ),
              const widgetEspacoH(
                altura: 16,
              ),
              Semantics(
                container: true,
                label: "Clique para ativar sua localização",
                child: widgetBotao(
                  text: "Ativar agora",
                  function: () {
                    widgetErro(
                      context: context,
                      text:
                          "Funcionalidade em desenvolvimento, entre como visitante.",
                    );
                  },
                ),
              ),
              const widgetEspacoH(
                altura: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
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
                      style: roboto16W400EA5,
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
                      style: roboto16W400EA5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
