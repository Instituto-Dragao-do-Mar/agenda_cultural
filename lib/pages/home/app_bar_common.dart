import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class AppBarCommonWidget extends StatelessWidget {
  final String? urlImage1;
  final String? labelImage1;
  final String? urlImage2;
  final String? labelImage2;
  final String? labelGeneral;
  final String? semanticsLabel;
  final Function? functionImage1;
  final Function? functionImage2;

  const AppBarCommonWidget({
    super.key,
    this.labelGeneral,
    this.urlImage1,
    this.urlImage2,
    this.functionImage1,
    this.functionImage2,
    this.labelImage1,
    this.labelImage2,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget1;

    if (urlImage1 == null) {
      widget1 = const SizedBox.shrink();
    } else {
      widget1 = Semantics(
        container: false,
        label: labelImage1,
        child: GestureDetector(
          onTap: () {
            if (functionImage1 != null) {
              functionImage1!();
            }
          },
          child: Image.asset(
            'imagens/$urlImage1',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
      );
    }
    Widget widget2;
    if (urlImage2 == null) {
      widget2 = const SizedBox.shrink();
    } else {
      widget2 = Semantics(
        container: false,
        label: labelImage2,
        child: GestureDetector(
          onTap: () {
            if (functionImage2 != null) {
              functionImage2!();
            }
          },
          child: Image.asset(
            'imagens/$urlImage1',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
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
                labelGeneral ?? '',
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
