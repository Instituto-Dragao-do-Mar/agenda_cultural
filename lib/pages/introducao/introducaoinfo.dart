
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
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
            padding: EdgeInsets.only(left: 23,  right: 23, bottom: size.height * .1,),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "./imagens/background.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Este aplicativo é uma realização da Secretaria da Cultura"
                  " do Ceará para ampliar o acesso às programações da Rede Pública de"
                  " Equipamentos Culturais da Secult Ceará (Rece), em parceria com o "
                  "Instituto Dragão do Mar.",
                  style: inter24W500With,
                  textAlign: TextAlign.center,
                ),
                widgetEspacoH(altura: 207),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => widget.destino),
                        );
                      },
                      child: Text(
                        "Começar",
                        style: inter16W700With,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
