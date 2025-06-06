import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';

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
      height: 112 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
      child: Column(
        children: [
          Semantics(
            label: nameCategory,
            child: GestureDetector(
              onTap: applyFilterCategory,
              child: Container(
                width: 65 / FontsApp.tamanhoFonteBase16 * FontsApp.tamanhoBase,
                padding: EdgeInsets.all(isSelected ? 3 : 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.black : corBackgroundLaranja,
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: _getCategoryImage(),
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

  Image _getCategoryImage() {
    if (category.imagens?.first.url?.contains('http') ?? false) {
      return Image.network(
        category.imagens?.first.url ?? '',
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'imagens/${category.imagens?.first.url}',
        fit: BoxFit.cover,
      );
    }
  }
}
