import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/pages/notificacao/pagenotificacao.dart';

class AppBarGeneral extends StatelessWidget {
  final Function? notify;

  const AppBarGeneral({
    super.key,
    this.notify,
  });

  @override
  Widget build(BuildContext context) {
    AppModel app = context.read<AppModel>();

    return Row(
      children: [
        const SizedBox(width: 8),
        Image.asset(
          'imagens/icon_idm_orange.png',
          width: 24,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        Image.asset(
          'imagens/icon_cultura_ce.png',
          height: 18,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
