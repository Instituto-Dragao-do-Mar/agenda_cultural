import 'package:flutter/material.dart';

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
      ),
    );
  }
}
