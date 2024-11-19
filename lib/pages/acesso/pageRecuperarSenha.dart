import 'package:agendacultural/controller/user_controller.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/fonts.dart';
import '../../shared/constantes.dart';
import '../../shared/themes.dart';
import '../../shared/text_contrast_font.dart';
import '../../shared/button_default.dart';
import '../../shared/notify_pop_up.dart';
import '../../shared/widgetespacoh.dart';
import '../home/general/widgettopocomum.dart';

// ignore_for_file: use_build_context_synchronously

class PageRecuperarSenha extends StatefulWidget {
  const PageRecuperarSenha({Key? key}) : super(key: key);

  @override
  State<PageRecuperarSenha> createState() => _PageRecuperarSenhaState();
}

class _PageRecuperarSenhaState extends State<PageRecuperarSenha> {
  String emailInput = "";
  UserController? usuarioController;

  @override
  void initState() {
    super.initState();
    usuarioController = context.read<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        // leading: GestureDetector(
        //   onTap: () {
        //   },
        //   child: widgetImagemInterna(
        //     imagem: Imagem(url: 'seta.png'),
        //   ),
        // ),
        title: Semantics(
          label: "Tela de recuperação de senha",
          child: widgetTopoComum(
            funcaoImagem1: () async {
              Navigator.pop(context);
            },
            urlImagem1: 'seta.png',
            labelImagem1: "Voltar para página anterior",
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextContrastFont(
                    text:
                        AppLocalizations.of(context)!.login_reset_password_text,
                    semantics:
                        "Insira um email abaixo para receber o link de recuperação de senha.",
                    style: FontsApp.poppins12W400Grey((FontsApp.tamanhoBase)),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrastFont(
                    text: AppLocalizations.of(context)!.login_email,
                    style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                    semantics: "Rótulo de E-mail",
                  ),
                  Semantics(
                    container: false,
                    label: "Campo obrigatório",
                    child: TextContrastFont(
                      text: " *",
                      style: TextStyle(
                        color: corBackgroundLaranja,
                        fontSize: FontsApp.tamanhoBase.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 4,
              ),
              TextField(
                style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                onChanged: (value) {
                  setState(() {
                    emailInput = value;
                  });
                },
                decoration: textfieldDadosCadastro,
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Semantics(
                container: true,
                label: "Enviar",
                child: ButtonDefault(
                    text:
                        AppLocalizations.of(context)!.login_reset_password_send,
                    function: () async => {
                          await sendEmail(context),
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendEmail(BuildContext context) async {
    if (emailInput.characters.isEmpty) {
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_empty,
      );
      return;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailInput)) {
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_invalid,
      );
      return;
    }

    var errorMessage = await usuarioController?.sendRecoverPassword(
      email: emailInput,
    );

    if (usuarioController != null && errorMessage != "") {
      notifyPopUpWidget(
        context: context,
        textDescritivo: errorMessage ?? '',
      );
      return;
    }

    notifyPopUpWidget(
        context: context,
        textChamativo: AppLocalizations.of(context)!.login_reset_conclude_title,
        textDescritivo:
            AppLocalizations.of(context)!.login_reset_conclude_subtitle,
        textBotao: AppLocalizations.of(context)!.login_enter,
        erro: false,
        funcaoBotao: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const pageLogin(),
            ),
          );
        });
    return;
  }
}
