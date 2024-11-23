import 'package:flutter/material.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/image_ent.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/image_type.dart';

class ItemCategoryFilterWidget extends StatelessWidget {
  final Category category;
  final String nameCategory;
  final bool isSelected;
  final void Function() applyFilterCategory;

  const ItemCategoryFilterWidget({
    super.key,
    required this.category,
    required this.nameCategory,
    required this.isSelected,
    required this.applyFilterCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: corBgAtual,
      width: 70 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
      height: 110 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
      child: Column(
        children: [
          Semantics(
            label: "Categoria ${category.nome!}",
            child: GestureDetector(
              onTap: applyFilterCategory,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: isSelected ? Colors.black : corBackgroundLaranja,
                child: CircleAvatar(
                  radius: isSelected ? 26 : 30,
                  backgroundImage: _getCategoryImage(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextContrastFont(
            text: nameCategory,
            align: TextAlign.center,
            maxlines: 3,
            fontsize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 10),
          ),
        ],
      ),
    );
  }

  ImageProvider _getCategoryImage() {
    if (category.imagens!.first.url!.contains('http')) {
      return widgetImagemExterna(
        imagem: ImageEnt(
          base64: category.imagens!.first.base64,
          tipoimagem: category.imagens!.first.tipo! == 'U' ? TipoImagem.url : TipoImagem.base64,
          url: category.imagens!.first.url,
        ),
      );
    } else {
      return widgetImagemInternaProvider(
        imagem: ImageEnt(
          base64: category.imagens!.first.base64,
          tipoimagem: category.imagens!.first.tipo! == 'U' ? TipoImagem.url : TipoImagem.base64,
          url: category.imagens!.first.url,
        ),
      );
    }
  }
}
