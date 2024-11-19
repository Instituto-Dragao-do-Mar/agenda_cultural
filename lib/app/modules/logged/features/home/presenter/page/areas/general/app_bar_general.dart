import 'package:flutter/material.dart';

class AppBarGeneral extends StatelessWidget {
  const AppBarGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Image.asset(
          'imagens/icon_idm_orange.png',
          width: 24,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        Image.asset(
          'imagens/icon_cultura_ce.png',
          height: 18,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
