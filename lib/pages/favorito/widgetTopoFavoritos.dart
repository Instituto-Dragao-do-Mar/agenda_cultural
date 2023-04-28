// ignore_for_file: file_names, must_be_immutable

import 'package:agendacultural/pages/filtro/pagefiltro.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:flutter/material.dart';


class WidgetTopoFavoritos extends StatelessWidget {
  Function? notify;
  WidgetTopoFavoritos({super.key, this.notify});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: "Favoritos",
      funcaoImagem1: () async {
        notify!();
      },
      urlImagem1: 'seta.png',
      labelImagem1: "Voltar para página anterior",
        semanticsLabel: "Página de ",
      funcaoImagem2: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const pageFiltro(),
          ),
        );
      },
      urlImagem2: 'favoritos.png',
      labelImagem2: "Filtrar",
    );
  }
}

/*
class WidgetTopoFavoritos extends StatelessWidget {
  Function? notify;
  WidgetTopoFavoritos({Key? key, this.notify}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? text;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const widgetEspacoV(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                   notify!();
              },
              child: widgetImagemInterna(
                imagem: Imagem(
                  url: 'seta.png',
                ),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            const widgetEspacoV(largura: 18),
            Text(
              "Favoritos",
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            )
          ],
        ),
        const Expanded(child: SizedBox.shrink()),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pageLogin(),
                  ),
                );
              },
              child: widgetImagemInterna(
                imagem: Imagem(
                  url: 'Logout.png',
                ),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        const widgetEspacoV(),
      ],
    );
  }
}

*/