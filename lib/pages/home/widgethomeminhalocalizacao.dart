import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

class widgetHomeMinhaLocalizacao extends StatelessWidget {
  const widgetHomeMinhaLocalizacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "Minha Localização",
          style: TextStyle(color: corBackground, fontSize: 14),
        ),
        SizedBox(width: 5),
        Icon(
          Icons.arrow_forward_ios,
          color: corBackground,
          size: 14,
        ),
      ],
    );
  }
}
