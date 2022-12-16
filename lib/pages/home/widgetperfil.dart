
import 'package:agendacultural/pages/home/widgetperfilacessibilidade.dart';
import 'package:agendacultural/pages/home/widgetdadoscadastrais.dart';
import 'package:agendacultural/pages/home/widgetidiomas.dart';
import 'package:agendacultural/pages/home/widgetnotificacoes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';

import '../../model/app_model.dart';
import '../../model/fontes.dart';
import '../../shared/constantes.dart';
import '../../shared/themes.dart';
import 'widgets/widgetopcaoperfil.dart';

class widgetPerfil extends StatelessWidget {
  widgetPerfil({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      body: Container(
        color: corBgAtual,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Conta",
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            const widgetopacaoperfil(
              subtitulo: "Notificações e alertas",
              paginaDestino: widgetNotificacoes(),
            ),
            const widgetEspacoH(altura: 16),
            const widgetopacaoperfil(
              subtitulo: "Dados cadastrais",
              paginaDestino: widgetDadosCadastrais(),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              'Geral',
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            const widgetopacaoperfil(
              subtitulo: "Termos e Serviços",
              paginaDestino: widgetEmConstrucao(),
            ),
            const widgetEspacoH(altura: 16),
            const widgetopacaoperfil(
              subtitulo: "Ajuda",
              paginaDestino: widgetEmConstrucao(),
            ),
            const widgetEspacoH(altura: 16),
            const widgetopacaoperfil(
              subtitulo: "Sobre o app",
              paginaDestino: widgetEmConstrucao(),
            ),
            const widgetEspacoH(altura: 24),
            Text(
              'Acessibilidade',
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 12),
            const widgetopacaoperfil(
              subtitulo: "Recursos",
              paginaDestino: widgetPerfilAcessibilidade(),
            ),
            const widgetEspacoH(altura: 16),
            const widgetopacaoperfil(
              subtitulo: "Idioma",
              paginaDestino: widgetIdiomas(),
            ),
          ],
        ),
      ),
    );
  }
}

