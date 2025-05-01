// import 'package:web';
// import 'dart:js_interop';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/geolocalizacao_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgeterro.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';

import '../../model/fontes.dart';

class WidgetInserirLocalizacao extends StatefulWidget {
  const WidgetInserirLocalizacao({super.key});

  @override
  State<WidgetInserirLocalizacao> createState() =>
      _WidgetInserirLocalizacaoState();
}

class _WidgetInserirLocalizacaoState extends State<WidgetInserirLocalizacao> {
  String? nomeLocalizacao;
  TextEditingController tedLocal = TextEditingController();

  String? enderecoAtual;
  double? lat;
  double? lon;
  bool selecionado = false;

  Future<void> getdados() async {
    if (enderecoAtual == null || enderecoAtual!.isEmpty) {
      enderecoAtual = await Dados.getString('local_atual_descricao');

      if (enderecoAtual != null && enderecoAtual!.isNotEmpty) {
        lat = await Dados.getDouble('local_atual_latitude');
        lon = await Dados.getDouble('local_atual_longitude');
      }
    }
  }

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
      body: FutureBuilder(
        future: getdados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
            child: Column(
              children: [
                const widgetEspacoH(
                  altura: 31,
                ),
                Text(
                  'Informe abaixo onde você está no momento.',
                  style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        label: "Digite onde você está no momento.",
                        child: TextField(
                          controller: tedLocal,
                          style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                          onChanged: (value) {
                            /*setState(
                          () {
                          nomeLocalizacao = value;
                          },
                        );*/
                            nomeLocalizacao = value;
                          },
                        ),
                      ),
                    ),
                    Semantics(
                      label: "Clique para pesquisar a localização.",
                      child: IconButton(
                        onPressed: () async {
                          try {
                            GeoData data = await Geocoder2.getDataFromAddress(
                              language: 'pt-BR',
                              address: tedLocal.text,
                              googleMapApiKey:
                                  "AIzaSyDPiOz0fCI1sfLT3W2fe--unju-f2n9jbY",
                            );

                            // Se conseguiu achar, grava latitude e longitude

                            GeoLocalizacao.local_atual_latitude = data.latitude;
                            GeoLocalizacao.local_atual_longitude = data.longitude;

                            await Dados.setDouble(
                              'local_atual_latitude',
                              data.latitude,
                            );

                            await Dados.setDouble(
                              'local_atual_longitude',
                              data.longitude,
                            );

                            await Dados.setString(
                              'local_atual_descricao',
                              data.address,
                            );

                            selecionado = false;
                            enderecoAtual = null;
                            setState(() {});
                          } catch (e) {
                            widgetErro(
                              context: context,
                              descricao: "Localização não encontrada, "
                                  "tente informar o endereço com "
                                  "rua, bairro e cidade.",
                            );
                            selecionado = false;
                            enderecoAtual = null;
                          }
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                if (enderecoAtual != null && enderecoAtual!.isNotEmpty)
                  InkWell(
                    onTap: () {
                      selecionado = !selecionado;
                      setState(() {});
                    },
                    child: ListTile(
                      selected: selecionado,
                      title: Text(enderecoAtual!),
                      subtitle: Text(
                        "Latidude: ${lat!.toStringAsFixed(8)}, Longitude: ${lon!.toStringAsFixed(8)}",
                      ),
                      selectedColor: corBackgroundLaranja,
                    ),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
