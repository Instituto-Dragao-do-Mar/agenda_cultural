// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/notificacao/pagenotificacao.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class widgetTopo extends StatelessWidget {
  Function? notify;
  bool? notificacao;

  widgetTopo({Key? key, this.notify, this.notificacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppModel app = context.read<AppModel>();
    int nlidas = app.listaNotificacoes.NotificacoesNaoLidas();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 0),
        widgetImagemInterna(
          imagem: Imagem(url: 'iconelaranha.png'),
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 10),
        widgetImagemInterna(
          imagem: Imagem(url: 'iconculturacedemo.png'),
          //width: 160,
          height: 18,
          fit: BoxFit.contain,
        ),
        const Expanded(child: SizedBox.shrink()),
        if (notificacao == true)
          Semantics(
            container: false,
            label: "Notificações",
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pageNotificacao(notify: notify),
                  ),
                );
              },
              child: Badge(
                isLabelVisible: (app.isLog() && nlidas > 0),
                label: Text(nlidas.toString()),
                backgroundColor: corBackgroundLaranja.withOpacity(.5),
                child: widgetImagemInterna(
                  imagem: Imagem(url: 'iconenotificacao.png'),
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
