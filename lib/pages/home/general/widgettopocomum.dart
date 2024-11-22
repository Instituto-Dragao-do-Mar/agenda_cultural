import 'package:flutter/material.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import '../../../app/common/utils/theme/fonts.dart';

class widgetTopoComum extends StatelessWidget {
  const widgetTopoComum({
    Key? key,
    this.text,
    this.urlImagem1,
    this.urlImagem2,
    this.funcaoImagem1,
    this.funcaoImagem2,
    this.labelImagem1,
    this.labelImagem2,
    this.semanticsLabel
  }) : super(key: key);

  final String? urlImagem1;
  final String? labelImagem1;
  final String? urlImagem2;
  final String? labelImagem2;
  final String? text;
  final Function? funcaoImagem1;
  final Function? funcaoImagem2;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    Widget widget1;

    if (urlImagem1 == null) {
      widget1 = const SizedBox.shrink();
    } else {
      widget1 = Semantics(
        container: false,
        label: labelImagem1,
        child: GestureDetector(
          onTap: () {
            if (funcaoImagem1 != null) {
              funcaoImagem1!();
            }
          },
          child: widgetImagemInterna(
            imagem: Imagem(
              url: urlImagem1,
            ),
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
      );
    }
    Widget widget2;
    if (urlImagem2 == null) {
      widget2 = const SizedBox.shrink();
    } else {
      widget2 = Semantics(
        container: false,
        label: labelImagem2,
        child: GestureDetector(
            onTap: () {
              if (funcaoImagem2 != null) {
                funcaoImagem2!();
              }
            },
            child: widgetImagemInterna(
              imagem: Imagem(
                url: urlImagem2,
              ),
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          widget1,
          const SizedBox(width: 8),
          Expanded(
            child: Semantics(
              label: semanticsLabel,
              child: Text(
                text ?? "",
                style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
              ),
            ),
          ),
          widget2,
        ],
      ),
    );
  }
}
