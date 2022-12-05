import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class Widgetalertdialog extends StatefulWidget {
  const Widgetalertdialog({Key? key}) : super(key: key);

  @override
  State<Widgetalertdialog> createState() => _WidgetalertdialogState();
}

class _WidgetalertdialogState extends State<Widgetalertdialog> {
  bool isAlert = true;
  @override
  Widget build(BuildContext context) {
    return isAlert
        ? Scaffold(
            backgroundColor: Color.fromRGBO(217, 217, 217, 0.4),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 16, top: 38, right: 16, bottom: 38),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Huum.. utilizamos cookies",
                            style: poppins16W400Black,
                          ),
                          const widgetEspacoV(largura: 10),
                          widgetImagemInterna(
                            imagem: Imagem(
                              url: "cookies.png",
                            ),
                          ),
                        ],
                      ),
                      widgetEspacoH(altura: 8),
                      Text(
                        "Nós armazenamos dados temporariamente para melhorar"
                        " a sua experiência de navegação e recomendar conteúdo de seu interesse."
                        " Ao utilizar nossos serviços, você concorda com tal monitoramento.",
                        semanticsLabel:
                            "Nós armazenamos dados temporariamente para melhorar"
                            " a sua experiência de navegação e recomendar conteúdo de seu interesse."
                            " Ao utilizar nossos serviços, você concorda com tal monitoramento.",
                        style: poppins12W400Grey,
                      ),
                      widgetEspacoH(altura: 16),
                      Row(
                        children: [
                          Expanded(
                            child: widgetBotao(
                              width: 164,
                              height: 48,
                              text: "Recusar",
                              negative: true,
                              function: () {
                                setState(() {
                                  isAlert = !isAlert;
                                });
                                // widgetErro(
                                //   context: context,
                                //   text:
                                //       "Funcionalidade em desenvolvimento, entre como visitante.",
                                // );
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
                                widgetErro(
                                  context: context,
                                  text:
                                      "Funcionalidade em desenvolvimento, entre como visitante.",
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
        : Container();
  }
}
