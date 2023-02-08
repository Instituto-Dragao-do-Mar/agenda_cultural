// ignore_for_file: camel_case_types

import 'package:agendacultural/controller/notificacao_controller.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/pages/notificacao/widgetnotificacaocard.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          funcaoImagem1: () async {
            widget.notify!();
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
        ),
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
                    widgetMensagemSuccess(
                      context: context,
                      text: app.listaNotificacoes.notificacoes![index].texto ??
                          "",
                      funcaoSim: () async {
                        await NotificacaoController().NotificacaoMarcaLidaPost(
                          userguidid: app.GetGuidId(),
                          idnotificacao: app
                              .listaNotificacoes.notificacoes![index].id
                              .toString(),
                          token: app.GetToken(),
                        );
                        app.listaNotificacoes =
                            await NotificacaoController().NotificacaoGet(
                          userguidid: app.GetGuidId(),
                          token: app.GetToken(),
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
    );
  }
}
