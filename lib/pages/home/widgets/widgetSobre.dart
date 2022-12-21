import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/fontes.dart';
import '../../../shared/themes.dart';

class WidgetSobre extends StatefulWidget {
  const WidgetSobre({Key? key}) : super(key: key);

  @override
  State<WidgetSobre> createState() => _WidgetSobreState();
}

class _WidgetSobreState extends State<WidgetSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          text: "Sobre o App",
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                TextContrasteFonte(
                  text:
                      "O aplicativo cultura.ce apresenta a agenda de eventos da Rede Pública de Espaços e Equipamentos Culturais da Secult Ceará (Rece), "
                      "a partir das informações disponíveis no Siscult - Mapa Cultural do Ceará.\n\n"
                      "Ele atende a uma demanda do campo cultural e de toda a sociedade: disponibilizar, "
                      "de forma fácil, centralizada e interativa, toda a programação cultural do Estado. "
                      "Feito pensando na melhor experiência de usabilidade para garantir ao público o acesso às programações culturais, em sua maioria gratuitas.\n\n"
                      "A primeira versão possui diversas funcionalidades de busca e visualização de eventos, além de opções de notificações e lembretes. Conta também recurso de acessibilidade para pessoas com deficiência visual.\n\n"
                      "Este projeto é uma realização da Secretaria da Cultura do Estado do Ceará (Secult) e desenvolvido pelo Instituto Dragão do Mar. Tem parceria com o Instituto Mirante de Cultura e Arte e com o Laboratório de Inovação e Dados do Governo do Ceará (Íris).",
                  style: Fontes.poppins16W500Black(Fontes.tamanhoBase),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
