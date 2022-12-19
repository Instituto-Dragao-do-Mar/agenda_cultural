import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/pages/localizacao/widgetlocalizacao.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:flutter/material.dart';

import '../../model/fontes.dart';

class Introducaoinfo extends StatefulWidget {
  const Introducaoinfo({
    Key? key,
    required this.destino,
  }) : super(key: key);
  final StatefulWidget destino;

  @override
  State<Introducaoinfo> createState() => _IntroducaoinfoState();
}

class _IntroducaoinfoState extends State<Introducaoinfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: gradientPrincipal,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Text(
                "Este aplicativo é uma realização da Secretaria da Cultura do "
                "Ceará para ampliar o acesso às programações da Rede Pública "
                "de Espaços Equipamentos Culturais do Estado do Ceará (Rece), "
                "desenvolvido em parceria com o Instituto Dragão do Mar (IDM). "
                " "
                "Aqui você encontra a programação cultural do Estado de "
                "forma fácil, centralizada e interativa. Feito para que "
                "você tenha a melhor experiência ao consultar a agenda"
                " cultural.",
                style: Fontes.inter24W500Withe(Fontes.tamanhoBase),
                semanticsLabel:
                    "Este aplicativo é uma realização da Secretaria da Cultura do "
                "Ceará para ampliar o acesso às programações da Rede Pública "
                "de Espaços Equipamentos Culturais do Estado do Ceará (Rece), "
                "desenvolvido em parceria com o Instituto Dragão do Mar (IDM). "
                " "
                "Aqui você encontra a programação cultural do Estado de "
                "forma fácil, centralizada e interativa. Feito para que "
                "você tenha a melhor experiência ao consultar a agenda"
                " cultural.",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Dados.setBool('governo', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const Widgetlocalizacao(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: const Color(0XFFF9E8D8),
                height: 63,
                alignment: Alignment.center,
                child: Text(
                  "Acessar",
                  style: Fontes.inter16W500Black(Fontes.tamanhoBase),
                  semanticsLabel: "Botão Acessar",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
