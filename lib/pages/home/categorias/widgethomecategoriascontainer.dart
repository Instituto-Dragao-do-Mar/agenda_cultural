// ignore_for_file: camel_case_types

import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:flutter/material.dart';

class widgetHomeCategoriasContainer extends StatefulWidget {
  const widgetHomeCategoriasContainer({
    super.key,
    required this.categoria,
  });

  final Categoria categoria;

  @override
  State<widgetHomeCategoriasContainer> createState() =>
      _widgetHomeCategoriasContainerState();
}

class _widgetHomeCategoriasContainerState
    extends State<widgetHomeCategoriasContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 70,
        height: 120,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  //widget.categoria.selecionada = !widget.categoria.selecionada!;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: corBackground,
                child: CircleAvatar(
                  radius: widget.categoria.selecionada! ? 26 : 30,
                  backgroundImage: widgetImagemExterna(
                    imagem: Imagem(
                      base64: widget.categoria.imagens!.first.base64,
                      tipoimagem: widget.categoria.imagens!.first.tipo! == 'U'
                          ? TipoImagem.url
                          : TipoImagem.base64,
                      url: widget.categoria.imagens!.first.url,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.categoria.nome!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
