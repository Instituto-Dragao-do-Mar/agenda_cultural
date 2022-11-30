import 'package:agendacultural/shared/constantes.dart';
import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
          gradient: gradientPrincipal,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Text(
                "Este aplicativo é uma realização da Secretaria da Cultura"
                " do Ceará para ampliar o acesso às programações da Rede Pública de"
                " Equipamentos Culturais da Secult Ceará (Rece), em parceria com o "
                "Instituto Dragão do Mar.",
                style: inter24W500Withe,
                semanticsLabel:
                    "Este aplicativo é uma realização da Secretaria da Cultura"
                    " do Ceará para ampliar o acesso às programações da Rede Pública de"
                    " Equipamentos Culturais da Secult Ceará (Rece), em parceria com o "
                    "Instituto Dragão do Mar.",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => widget.destino),
                );
              },
              child: Container(
                width: double.infinity,
                color: const Color(0XFFF9E8D8),
                height: 63,
                alignment: Alignment.center,
                child: Text(
                  "Acessar",
                  style: inter16W500Black,
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
