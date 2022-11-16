
import 'package:agendacultural/pages/home/widgetdadoscadastrais.dart';
import 'package:agendacultural/pages/home/widgetnotificacoes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';

import '../../shared/constantes.dart';
import 'widgets/widgetopcaoperfil.dart';

class widgetPerfil extends StatelessWidget {
  widgetPerfil({super.key});
  // final GoRouter _router = GoRouter(routes: <GoRoute>[
  //   GoRoute(
  //     path: '/',
  //     builder: (context, state) => HomeWidgetperfil(),
  //   ),
  //   GoRoute(
  //     path: '/widgetperfil',
  //     builder: (context, state) => HomeWidgetperfil(),
  //   ),
  //   GoRoute(
  //     path: '/widgetnotificacoes',
  //     builder: (context, state) => widgetNotificacoes(),
  //   ),
  //   GoRoute(
  //     path: '/widgetdadoscadastrais',
  //     builder: (context, state) => widgetdadoscadastrais(),
  //   ),
  //   // ...
  // ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Conta",
            style: poppins18W500Black,
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
            style: poppins18W500Black,
          ),
          const widgetEspacoH(altura: 12),
          const widgetopacaoperfil(
            subtitulo: "Termos e Serviços",
            paginaDestino: widgetDadosCadastrais(),
          ),
          const widgetEspacoH(altura: 16),
          const widgetopacaoperfil(
            subtitulo: "Ajuda",
            paginaDestino: widgetDadosCadastrais(),
          ),
          const widgetEspacoH(altura: 16),
          const widgetopacaoperfil(
            subtitulo: "Sobre o app",
            paginaDestino: widgetDadosCadastrais(),
          ),
          const widgetEspacoH(altura: 24),
          Text(
            'Acessibilidade',
            style: poppins18W500Black,
          ),
          const widgetEspacoH(altura: 12),
          const widgetopacaoperfil(
            subtitulo: "Recursos",
            paginaDestino: widgetDadosCadastrais(),
          ),
          const widgetEspacoH(altura: 16),
          const widgetopacaoperfil(
            subtitulo: "Idioma",
            paginaDestino: widgetDadosCadastrais(),
          ),
        ],
      ),
    );
  }
}

