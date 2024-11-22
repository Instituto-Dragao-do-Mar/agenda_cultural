import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';

//Usada apenas na page de notificação
void notifySuccessWidget({
  required BuildContext context,
  required String text,
  VoidCallback? funcaoSim,
  String buttonText = "Ok",
  String title = "Atenção",
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    headerAnimationLoop: false,
    title: title,
    desc: text,
    btnOkOnPress: funcaoSim ?? () {},
    btnOkText: buttonText,
    btnOkColor: const Color(0XFFEA5B0C),
  ).show();
}

void notifyPopUpWidget({
  required BuildContext context,
  required String textDescritivo,
  String? textChamativo,
  String? textBotao,
  String? textBotaoSecundario,
  bool erro = true,
  bool permitirFechar = false,
  VoidCallback? funcaoBotao,
  VoidCallback? funcaoBotaoSecundario,
}) async {
  await showDialog(
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: !ColorsApp.contraste ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: ColorsApp.contraste ? Colors.white : Colors.transparent),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: permitirFechar ? 0 : 42),
                    Text(
                      textChamativo ?? AppLocalizations.of(context)!.notification_attention,
                      style: FontsApp.poppins16W500Black(FontsApp.tamanhoBase + 2),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textDescritivo,
                      style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase - 2),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: funcaoBotao ?? () => Navigator.pop(context),
                        child: Text(
                          textBotao ?? AppLocalizations.of(context)!.notification_ok,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontsApp.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                    ),
                    if (permitirFechar) const SizedBox(height: 10),
                    if (permitirFechar)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: funcaoBotaoSecundario ?? () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.grey, width: 1),
                          ),
                          child: Text(
                            textBotaoSecundario ?? AppLocalizations.of(context)!.notification_cancel,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: FontsApp.tamanhoBase.toDouble(),
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
                      border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 5),
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
