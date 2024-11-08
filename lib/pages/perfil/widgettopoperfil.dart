// ignore_for_file: camel_case_types, must_be_immutable

import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class widgetTopoPerfil extends StatelessWidget {
  Function? notify;

  widgetTopoPerfil({super.key, this.notify});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: AppLocalizations.of(context)!.profile_title,
      funcaoImagem1: () async {
        notify!();
      },
      urlImagem1: 'seta.png',
      semanticsLabel: "Página de ",
      funcaoImagem2: () {
        UserSharedPreferences.resetUser().then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const pageLogin(),
            ),
          ),
        );
      },
      urlImagem2: 'Logout.png',
      labelImagem2: "Sair do aplicativo",
      labelImagem1: "Voltar para página anterior",
    );
  }
}
