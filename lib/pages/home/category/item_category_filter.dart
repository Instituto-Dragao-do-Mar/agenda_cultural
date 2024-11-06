import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class ItemCategoryFilterWidget extends StatefulWidget {
  const ItemCategoryFilterWidget({
    super.key,
    required this.categoria,
  });

  final Categoria categoria;

  @override
  State<ItemCategoryFilterWidget> createState() => _ItemCategoryFilterWidgetState();
}

class _ItemCategoryFilterWidgetState extends State<ItemCategoryFilterWidget> {
  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: corBgAtual,
      width: 70 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
      height: 110 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
      child: Column(
        children: [
          Semantics(
            label: "Categoria ${widget.categoria.nome!}",
            child: GestureDetector(
              onTap: _applyFilterCategory,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: widget.categoria.selecionada! ? Colors.black : corBackgroundLaranja,
                child: CircleAvatar(
                  radius: widget.categoria.selecionada! ? 26 : 30,
                  backgroundImage: _getCategoryImage(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextContrasteFonte(
            text: app.getNomeCategoria(widget.categoria.nome!, context),
            align: TextAlign.center,
            fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 10),
          ),
        ],
      ),
    );
  }

  void _applyFilterCategory() {
    app.filtro.categoriasSelecionadas!.clear();

    for (Categoria c in app.listaCategoria.categorias!) {
      if (c != widget.categoria) {
        c.selecionada = false;
      }
    }

    widget.categoria.selecionada = !widget.categoria.selecionada!;

    if (widget.categoria.selecionada!) {
      app.filtro.categoriasSelecionadas!.add(widget.categoria);
    }

    app.notify();
  }

  ImageProvider _getCategoryImage() {
    if (widget.categoria.imagens!.first.url!.contains('http')) {
      return widgetImagemExterna(
        imagem: Imagem(
          base64: widget.categoria.imagens!.first.base64,
          tipoimagem: widget.categoria.imagens!.first.tipo! == 'U' ? TipoImagem.url : TipoImagem.base64,
          url: widget.categoria.imagens!.first.url,
        ),
      );
    } else {
      return widgetImagemInternaProvider(
        imagem: Imagem(
          base64: widget.categoria.imagens!.first.base64,
          tipoimagem: widget.categoria.imagens!.first.tipo! == 'U' ? TipoImagem.url : TipoImagem.base64,
          url: widget.categoria.imagens!.first.url,
        ),
      );
    }
  }
}
