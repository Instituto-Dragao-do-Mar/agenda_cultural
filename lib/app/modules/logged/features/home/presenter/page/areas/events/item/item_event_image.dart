import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

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
          ? Image.network(
              urlImage,
              fit: BoxFit.cover,
            )
          : urlImage.contains('http')
              ? Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'imagens/${urlImage.replaceFirst('.png', 'padrao.png')}',
                  fit: BoxFit.cover,
                ),
    );
  }
}
