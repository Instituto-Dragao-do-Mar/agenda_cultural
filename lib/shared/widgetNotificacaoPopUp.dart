import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// usada apenas na page de notificação
void widgetMensagemSuccess({
  required BuildContext context,
  required String text,
  VoidCallback? funcaoSim,
  String buttonText = "Ok",
  String title = "Atenção",
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    // animType: AnimType.bottomSlide,
    headerAnimationLoop: false,
    title: title,
    desc: text,
    btnOkOnPress: funcaoSim ?? () {},
    btnOkText: buttonText,
    // btnOkIcon: Icons.cancel,
    btnOkColor: const Color(0XFFEA5B0C),
  ).show();
}

void widgetNotificaoPopUp({
  required BuildContext context,
  required String textDescritivo,
  String? textChamativo,
  String? textBotao,
  String? textBotaoSecundario,
  bool erro = true,
  bool permitirFechar = false,
  VoidCallback? funcaoBotao,
  VoidCallback? funcaoBotaoSecundario,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 52),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              color: const Color.fromRGBO(0, 0, 0, 0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: !Cores.contraste ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          Cores.contraste ? Colors.white : Colors.transparent,
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widgetEspacoH(altura: permitirFechar ? 0 : 42),
                    Text(
                      textChamativo ??
                          AppLocalizations.of(context)!.notification_attention,
                      style: Fontes.poppins16W400Black(Fontes.tamanhoBase + 2),
                    ),
                    const widgetEspacoH(altura: 10),
                    Text(
                      textDescritivo,
                      style: Fontes.poppins16W400Black(Fontes.tamanhoBase - 2),
                      textAlign: TextAlign.center,
                    ),
                    const widgetEspacoH(altura: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: funcaoBotao ??
                            () {
                              Navigator.pop(context);
                            },
                        child: Text(
                          textBotao ??
                              AppLocalizations.of(context)!.notification_ok,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Fontes.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                    ),
                    if (permitirFechar) const widgetEspacoH(altura: 8),
                    if (permitirFechar)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: funcaoBotaoSecundario ??
                              () {
                                Navigator.pop(context);
                              },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            textBotaoSecundario ??
                                AppLocalizations.of(context)!
                                    .notification_cancel,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Fontes.tamanhoBase.toDouble(),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            if (!permitirFechar)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: erro ? Colors.red : Colors.green,
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        erro ? Icons.close_rounded : Icons.check_rounded,
                        color: Colors.white,
                        size: 72,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
    },
  );
}
