import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

import '../model/fontes.dart';

class Widgetalertdialog extends StatefulWidget {
  const Widgetalertdialog({Key? key}) : super(key: key);

  @override
  State<Widgetalertdialog> createState() => _WidgetalertdialogState();
}

class _WidgetalertdialogState extends State<Widgetalertdialog> {
  bool aceitei = false;
  @override
  Widget build(BuildContext context) {
    return aceitei
        ? const SizedBox.shrink()
        : Scaffold(
            backgroundColor: const Color.fromRGBO(217, 217, 217, 0.4),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 16, top: 38, right: 16, bottom: 38),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Huum.. utilizamos cookies",
                            style:
                                Fontes.poppins16W400Black(Fontes.tamanhoBase),
                          ),
                          const widgetEspacoV(largura: 10),
                          widgetImagemInterna(
                            imagem: Imagem(
                              url: "cookies.png",
                            ),
                          ),
                        ],
                      ),
                      const widgetEspacoH(altura: 8),
                      Text(
                        "Nós armazenamos dados temporariamente para melhorar a sua experiência de "
                            "navegação e recomendar conteúdo de seu interesse. "
                            "Ao recusar pode impossibilitar a utilização de alguns dos recursos.",
                        semanticsLabel:
                            "Nós armazenamos dados temporariamente para melhorar"
                            " a sua experiência de navegação e recomendar conteúdo de seu interesse. "
                            "Ao recusar pode impossibilitar a utilização de alguns dos recursos.",
                        style: Fontes.poppins12W400Grey(Fontes.tamanhoBase),
                      ),
                      const widgetEspacoH(altura: 16),
                      Row(
                        children: [
                          Expanded(
                            child: widgetBotao(
                              width: 164,
                              height: 48,
                              text: "Recusar",
                              negative: true,
                              function: () {
                                aceitei = true;
                                Dados.setBool('cookies', false);
                                Dados.jaVisualizouCookies = false;
                                setState(() {});
                              },
                            ),
                          ),
                          const widgetEspacoV(largura: 16),
                          Expanded(
                            child: widgetBotao(
                              width: 164,
                              height: 48,
                              text: "Aceitar",
                              function: () {
                                aceitei = true;
                                Dados.setBool('cookies', true);
                                Dados.jaVisualizouCookies = true;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
