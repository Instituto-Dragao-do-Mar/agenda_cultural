import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
