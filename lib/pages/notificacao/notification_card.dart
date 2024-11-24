import 'package:flutter/material.dart';
import 'package:agendacultural/model/notificacao_model.dart';

class NotificationCardWidget extends StatelessWidget {
  final Notificacao notificacao;

  const NotificationCardWidget({
    super.key,
    required this.notificacao,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        notificacao.lida == 0 ? Icons.notifications_active : Icons.notifications_none,
      ),
      title: Text(notificacao.nomeevento ?? ''),
      subtitle: Text(notificacao.texto ?? ''),
    );
  }
}
