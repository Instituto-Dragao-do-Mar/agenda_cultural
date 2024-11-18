import 'package:flutter/material.dart';

class SpaceDetailImageWidget extends StatelessWidget {
  final String? urlImage;

  const SpaceDetailImageWidget({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * .9,
      child: Semantics(
        label: 'Imagem do espaço',
        child: urlImage == null
            ? Image.asset(
                'imagens/Outros - 1padrao.png',
                fit: BoxFit.cover,
              )
            : Image.network(
                urlImage!.replaceAll('homolog', ''),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
