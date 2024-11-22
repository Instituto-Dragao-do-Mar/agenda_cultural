import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/pages/notificacao/widgetnotificacaocard.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/notification_controller.dart';

class pageNotificacao extends StatefulWidget {
  const pageNotificacao({
    super.key,
    required this.notify,
  });

  final Function? notify;

  @override
  State<pageNotificacao> createState() => _pageNotificacaoState();
}

class _pageNotificacaoState extends State<pageNotificacao> {
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
        title: widgetTopoComum(
          text: "Notificações",
          semanticsLabel: "Página de Notificações",
          funcaoImagem1: () async {
            widget.notify!();
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
          labelImagem1: "Voltar para página anterior",
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
                      funcaoSim: () async {
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
                  child: widgetNotificacaoCard(
                    notificacao: app.listaNotificacoes.notificacoes![index],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: WidgetBottomNavigator(),
    );
  }
}
