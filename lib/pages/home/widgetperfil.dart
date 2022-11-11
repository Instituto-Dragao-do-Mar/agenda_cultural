import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';

import '../../shared/constantes.dart';
import 'widgets/widgetopcaoperfil.dart';

class widgetPerfil extends StatelessWidget {
  const widgetPerfil({super.key});

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
          widgetopacaoperfil(
            subtitulo: "Notificações e alertas",
            funcao: () {},
          ),
          const widgetEspacoH(altura: 16),
          widgetopacaoperfil(
            subtitulo: "Dados cadastrais",
            funcao: () {},
          ),
          const widgetEspacoH(altura: 24),
          Text(
            'Geral',
            style: poppins18W500Black,
          ),
          const widgetEspacoH(altura: 12),
          widgetopacaoperfil(
            subtitulo: "Termos e Serviços",
            funcao: () {},
          ),
          const widgetEspacoH(altura: 16),
          widgetopacaoperfil(
            subtitulo: "Ajuda",
            funcao: () {},
          ),
          const widgetEspacoH(altura: 16),
          widgetopacaoperfil(
            subtitulo: "Sobre o app",
            funcao: () {},
          ),
          const widgetEspacoH(altura: 24),
          Text(
            'Acessibilidade',
            style: poppins18W500Black,
          ),
          const widgetEspacoH(altura: 12),
          widgetopacaoperfil(
            subtitulo: "Recursos",
            funcao: () {},
          ),
          const widgetEspacoH(altura: 16),
          widgetopacaoperfil(
            subtitulo: "Idioma",
            funcao: () {},
          ),
        ],
      ),
    );
  }
}
