import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';

//Usada apenas na page de notificação
void notifySuccessWidget({
  required BuildContext context,
  required String text,
  VoidCallback? functionYes,
  String buttonText = 'Ok',
  String title = 'Atenção',
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    headerAnimationLoop: false,
    title: title,
    desc: text,
    btnOkOnPress: functionYes ?? () {},
    btnOkText: buttonText,
    btnOkColor: const Color(0XFFEA5B0C),
  ).show();
}

void notifyPopUpWidget({
  required BuildContext context,
  required String description,
  String? labelPrincipal,
  String? labelButton,
  String? labelSecondButton,
  bool error = true,
  bool enablePop = false,
  VoidCallback? functionButton,
  VoidCallback? functionSecondButton,
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
                    SizedBox(height: enablePop ? 0 : 42),
                    Text(
                      labelPrincipal ?? AppLocalizations.of(context)!.notification_attention,
                      style: FontsApp.poppins16W500Black(FontsApp.tamanhoBase + 2),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase - 2),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: functionButton ?? () => Navigator.pop(context),
                        child: Text(
                          labelButton ?? AppLocalizations.of(context)!.notification_ok,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontsApp.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                    ),
                    if (enablePop) const SizedBox(height: 10),
                    if (enablePop)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: functionSecondButton ?? () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            side: const BorderSide(color: Colors.grey, width: 1),
                          ),
                          child: Text(
                            labelSecondButton ?? AppLocalizations.of(context)!.notification_cancel,
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
            if (!enablePop)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: error ? Colors.red : Colors.green,
                      border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        error ? Icons.close_rounded : Icons.check_rounded,
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
