import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import '../../model/fontes.dart';

class WidgetInserirLocalizacao extends StatefulWidget {
  const WidgetInserirLocalizacao({Key? key}) : super(key: key);

  @override
  State<WidgetInserirLocalizacao> createState() =>
      _WidgetInserirLocalizacaoState();
}

class _WidgetInserirLocalizacaoState extends State<WidgetInserirLocalizacao> {
  String? nomeLocalizacao;
  TextEditingController tedLocal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          urlImagem1: "seta.png",
          funcaoImagem1: () {
            Navigator.pop(context);
          },
          text: 'Inserir seu endereço atual',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
        child: Column(
          children: [
            const widgetEspacoH(
              altura: 31,
            ),
            Text(
              'Informe onde você esta no momento.',
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tedLocal,
                    style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                    onChanged: (value) {
                      setState(
                        () {
                          nomeLocalizacao = value;
                        },
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    GeoData data = await Geocoder2.getDataFromAddress(
                      language: 'pt-BR',                      
                      address: tedLocal.text,
                      googleMapApiKey:
                          "AIzaSyDPiOz0fCI1sfLT3W2fe--unju-f2n9jbY",
                    );

                    //Formated Address
                    print(data.address);
                    //City Name
                    print(data.city);
                    //Country Name
                    print(data.country);
                    //Country Code
                    print(data.countryCode);
                    //Latitude
                    print(data.latitude);
                    //Longitude
                    print(data.longitude);
                    //Postal Code
                    print(data.postalCode);
                    //State
                    print(data.state);
                    //Street Number
                  
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            const widgetEspacoH(
              altura: 26,
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            widgetBotao(
              text: "Confirmar",
              function: () {
                Dados.setBool('localizacao', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pageLogin(),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            /*GestureDetector(
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
                    semanticsLabel: "Entrar como vivitante",
                    style: Fontes.roboto16W400EA5(Fontes.tamanhoBase),
                  ),
                ),
              ),
            ),
            const widgetEspacoH(
              altura: 32,
            ),*/
          ],
        ),
      ),
    );
  }
}
