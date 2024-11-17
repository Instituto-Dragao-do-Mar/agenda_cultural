import 'package:flutter/material.dart';

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';

class EventDetailImageWidget extends StatelessWidget {
  final String urlImage;

  const EventDetailImageWidget({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * .9,
      child: Semantics(
        label: 'Imagem do evento',
        child: urlImage.contains('https')
            ? widgetImagemExterna(
                imagem: Imagem(
                  tipoimagem: TipoImagem.url,
                  url: urlImage,
                ),
                fit: BoxFit.cover,
              )
            : urlImage.contains('http')
                ? Image.network(
                    urlImage,
                  )
                : widgetImagemInterna(
                    imagem: Imagem(
                      tipoimagem: TipoImagem.url,
                      url: urlImage.replaceFirst('.png', 'padrao.png'),
                    ),
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }
}
