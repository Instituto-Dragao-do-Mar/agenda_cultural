import 'package:flutter/material.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';

class ItemEventImageWidget extends StatelessWidget {
  final String urlImage;

  const ItemEventImageWidget({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
      width: 180 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0), top: Radius.circular(10)),
      ),
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
    );
  }
}
