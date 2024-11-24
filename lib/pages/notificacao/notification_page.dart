import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/home/app_bar_common.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/common/widgets/bottom_navigator.dart';
import 'package:agendacultural/pages/notificacao/notification_card.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
    required this.notify,
  });

  final Function? notify;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: AppBarCommonWidget(
          labelGeneral: "Notificações",
          semanticsLabel: "Página de Notificações",
          functionImage1: () async {
            widget.notify!();
            Navigator.pop(context);
          },
          urlImage1: 'seta.png',
          labelImage1: "Voltar para página anterior",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: app.listaNotificacoes.notificacoes!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    notifySuccessWidget(
                      context: context,
                      text: app.listaNotificacoes.notificacoes![index].texto ?? "",
                      functionYes: () async {
                        await NotificacaoController().postNotificationAsRead(
                          userguidid: app.getGuidId(),
                          idnotificacao: app.listaNotificacoes.notificacoes![index].id.toString(),
                          token: app.getToken(),
                        );
                        app.listaNotificacoes = await NotificacaoController().getNotifications(
                          userguidid: app.getGuidId(),
                          token: app.getToken(),
                        );
                        setState(() {});
                      },
                    );
                  },
                  child: NotificationCardWidget(
                    notificacao: app.listaNotificacoes.notificacoes![index],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
