import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  widgetImagem(
                    imagem: Imagem(
                      url: "local.png",
                    ),
                  ),
                  Expanded(child: Row()),
                  IconButton(
                    onPressed: () {},
                    icon: widgetImagem(
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
              const widgetBotao(
                text: "Ativar agora",
              ),
              const widgetEspacoH(
                altura: 32,
              ),
              GestureDetector(
                onTap: () {
                  print("ok");
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                  width: double.infinity,
                  height: 65,
                  child: Center(
                    child: Text(
                      "Inserir localização manualmente",
                      semanticsLabel: "Inserir localização manualmente",
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
