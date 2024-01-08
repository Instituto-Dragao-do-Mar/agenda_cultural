// ignore_for_file: use_build_context_synchronously

import 'dart:html';

import 'package:agendacultural/controller/geolocalizacao_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/geolocalizacao_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/localizacao/widgetinserirlocalizacao.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetProcessando.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../../model/fontes.dart';

class Widgetlocalizacao extends StatelessWidget {
  const Widgetlocalizacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopo(notificacao: false),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Onde você está?",
                  style: Fontes.poppins18W400222(Fontes.tamanhoBase),
                ),
                const widgetEspacoV(largura: 10),
                widgetImagemInterna(
                  imagem: Imagem(
                    url: "local.png",
                  ),
                ),
              ],
            ),
            const widgetEspacoH(
              altura: 17,
            ),
            Text(
              "Definir sua localização facilitará a busca por informações relacionadas "
                  "aos eventos que estão acontecendo ao seu redor e espaços culturais da cidade!",
              style: Fontes.poppins14W400Grey(Fontes.tamanhoBase),
              semanticsLabel:
                  "Definir sua localização facilitará a busca por informações relacionadas "
                      "aos eventos que estão acontecendo ao seu redor e espaços culturais da cidade!",
            ),
            const widgetEspacoH(
              altura: 16,
            ),
            widgetBotao(
              text: "Ativar agora",
              function: () async {
                Location _location = Location();

                PermissionStatus _temPermissao =
                    await _location.hasPermission();

                if (_temPermissao == PermissionStatus.granted) {
                  await Dados.setBool('localizacao', true);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pageLogin(),
                    ),
                  );
                } else {
                  _temPermissao = await _location.requestPermission();

                  if (_temPermissao == PermissionStatus.denied) {
                    widgetMensagem(
                      context: context,
                      text: "É necessário da a permissão ao app de "
                          " obter a localização via GPS ou informar o local "
                          "manualmente.",
                    );
                    return;
                  } else {
                    await widgetProcessamento(
                      mensagem: 'Obtendo localização ...',
                    );
                    Location location = Location();
                    LocationData _locationData;

                    _locationData = await location.getLocation();

                    GeoLocalizacaoController geoController =
                        GeoLocalizacaoController();

                    GeoLocalizacao geo = await geoController.GeoLocalizacaoGet(
                      latitude: _locationData.latitude!,
                      logitude: _locationData.longitude!,
                    );

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

                    await widgetProcessamento();

                    await Dados.setBool('localizacao', true);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const pageLogin(),
                      ),
                    );
                  }
                }
              },
            ),
            const widgetEspacoH(
              altura: 32,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WidgetInserirLocalizacao(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                width: double.infinity,
                height: 65,
                child: Center(
                  child: Text(
                    "Inserir localização manualmente",
                    semanticsLabel: "Inserir localização manualmente",
                    style: Fontes.roboto16W400EA5(Fontes.tamanhoBase),
                  ),
                ),
              ),
            ),
            GestureDetector(
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
                    semanticsLabel: "Entrar",
                    style: Fontes.roboto16W400EA5(Fontes.tamanhoBase),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
