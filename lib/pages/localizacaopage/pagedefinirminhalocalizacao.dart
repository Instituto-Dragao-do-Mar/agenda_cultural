// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:agendacultural/controller/geolocalizacao_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/geolocalizacao_model.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetProcessando.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgeterro.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class pageDefinirMinhaLocalizacao extends StatefulWidget {
  const pageDefinirMinhaLocalizacao({super.key});

  @override
  State<pageDefinirMinhaLocalizacao> createState() =>
      _pageDefinirMinhaLocalizacaoState();
}

class _pageDefinirMinhaLocalizacaoState
    extends State<pageDefinirMinhaLocalizacao> {
  late AppModel app;
  int? fonte;
  bool? contraste = false;

  String? enderecoAtual;
  double? lat;
  double? lon;
  bool selecionado = false;

  TextEditingController tedLocalizacao = TextEditingController();

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    getFonte().then((value) => fonte = value);
    getContraste().then((value) => contraste = value);
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          text: "Localização",
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
        ),
      ),
      body: FutureBuilder(
        future: getdados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return body();
        },
      ),
      bottomNavigationBar: selecionado ? btnConfirmar() : null,
    );
  }

  Widget btnConfirmar() {
    return widgetBotao(
      function: () {},
      text: "Confirmar",
      width: 200,
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tedLocalizacao,
                    style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                    decoration: InputDecorationDefault(
                      hint: "Digite sua localização",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () async {
                    try {
                      GeoData data = await Geocoder2.getDataFromAddress(
                        language: 'pt-BR',
                        address: tedLocalizacao.text,
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
                        descricao: "Localização não encontrada, tente informar "
                            "o endereço com rua, bairro e cidade.",
                      );
                    }
                  },
                  child: Icon(
                    Icons.search,
                    color: corBackgroundLaranja,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {                

                await widgetProcessamento(mensagem: 'Localizando...');

                Location location = Location();

                bool _serviceEnabled;
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    await widgetProcessamento();
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  await widgetProcessamento();
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }

                _locationData = await location.getLocation();

                GeoLocalizacaoController geoController =
                    GeoLocalizacaoController();

                GeoLocalizacao geo = await geoController.GeoLocalizacaoGet(
                  latitude: _locationData.latitude!,
                  logitude: _locationData.longitude!,
                );

                await widgetProcessamento();                

                await Dados.setDouble(
                  'local_atual_latitude',
                  _locationData.latitude!,
                );

                await Dados.setDouble(
                  'local_atual_longitude',
                  _locationData.longitude!,
                );

                await Dados.setString(
                  'local_atual_descricao',
                  geo.getEndereco(),
                );

                selecionado = false;
                enderecoAtual = null;
                setState(() {});
              },
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: corBackgroundLaranja,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Usar minha localização atual.",
                      semanticsLabel: "Usar minha localização atual.",
                      style: Fontes.poppins14W400E83C3B(
                        (Fontes.tamanhoBase),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
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
          ],
        ),
      ),
    );
  }

  Future<int> getFonte() async => await Dados.getInt('tamanhofontebase');

  Future<bool> getContraste() async => await Dados.getBool('altocontraste');
}
