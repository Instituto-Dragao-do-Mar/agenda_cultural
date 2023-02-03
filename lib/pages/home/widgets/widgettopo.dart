// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class widgetTopo extends StatelessWidget {
  Function? notify;
  widgetTopo({
    Key? key,
    this.notify
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppModel app = context.read<AppModel>();
    int nlidas = app.listaNotificacoes.NotificacoesNaoLidas() ;

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
        Badge(
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
      ],
    );
  }
}
