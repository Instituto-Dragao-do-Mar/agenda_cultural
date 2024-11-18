import 'package:flutter/material.dart';
import 'package:agendacultural/model/fontes.dart';

class ItemSpaceImageWidget extends StatelessWidget {
  final String? urlImage;

  const ItemSpaceImageWidget({
    super.key,
    this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
      width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
      child: urlImage == null
          ? Image.asset(
              'imagens/Outros - 1padrao.png',
              fit: BoxFit.cover,
            )
          : Image.network(
              urlImage?.replaceAll('homolog', '') ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'imagens/Outros - 1padrao.png',
                  fit: BoxFit.cover,
                );
              },
            ),
    );
  }
}
