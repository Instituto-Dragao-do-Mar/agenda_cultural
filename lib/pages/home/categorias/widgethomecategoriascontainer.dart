// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/cores.dart';
import '../../../model/fontes.dart';
import '../../../shared/widgetTextFonteContraste.dart';

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
  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: corBgAtual,
        width: 70 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        height: 120 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.categoria.selecionada = !widget.categoria.selecionada!;

                  if (!widget.categoria.selecionada!) {
                    if (app.filtro.categoriasSelecionadas!
                        .any((e) => e.id! == widget.categoria.id!)) {
                      app.filtro.categoriasSelecionadas!
                          .removeWhere((e) => e.id! == widget.categoria.id!);
                    }
                  } else {
                    if (!app.filtro.categoriasSelecionadas!
                        .any((e) => e.id! == widget.categoria.id!)) {
                      app.filtro.categoriasSelecionadas!.add(widget.categoria);
                    }
                  }
                 /*  print(
                      'Lista Categorias: ${app.filtro.categoriasSelecionadas!.length}'); */
                  app.notify();
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: widget.categoria.selecionada!
                    ? Colors.black
                    : corBackgroundLaranja,
                child: CircleAvatar(
                  radius: widget.categoria.selecionada! ? 26 : 30,
                  backgroundImage:
                      widget.categoria.imagens!.first.url!.contains('http')
                          ? widgetImagemExterna(
                              imagem: Imagem(
                                base64: widget.categoria.imagens!.first.base64,
                                tipoimagem:
                                    widget.categoria.imagens!.first.tipo! == 'U'
                                        ? TipoImagem.url
                                        : TipoImagem.base64,
                                url: widget.categoria.imagens!.first.url,
                              ),
                            )
                          : widgetImagemInternaProvider(
                              imagem: Imagem(
                                base64: widget.categoria.imagens!.first.base64,
                                tipoimagem:
                                    widget.categoria.imagens!.first.tipo! == 'U'
                                        ? TipoImagem.url
                                        : TipoImagem.base64,
                                url: widget.categoria.imagens!.first.url,
                              ),
                            ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextContrasteFonte(
              text: widget.categoria.nome!,
              align: TextAlign.center,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 10),
            ),
          ],
        ),
      ),
    );
  }
}
