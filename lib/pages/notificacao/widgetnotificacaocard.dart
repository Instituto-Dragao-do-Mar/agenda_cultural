// ignore_for_file: camel_case_types

import 'package:agendacultural/model/notificacao_model.dart';
import 'package:flutter/material.dart';

class widgetNotificacaoCard extends StatelessWidget {
  const widgetNotificacaoCard({
    super.key,
    required this.notificacao,
  });

  final Notificacao notificacao;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        notificacao.lida == 0
            ? Icons.notifications_active
            : Icons.notifications_none,
      ),
      title: Text(notificacao.nomeevento ?? ""),
      subtitle: Text(notificacao.texto ?? ""),
    );
  }
}
