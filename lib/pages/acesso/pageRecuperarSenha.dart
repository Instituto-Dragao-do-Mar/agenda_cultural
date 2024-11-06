import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/fontes.dart';
import '../../shared/constantes.dart';
import '../../shared/themes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetbotao.dart';
import '../../shared/widgetNotificacaoPopUp.dart';
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
  UsuarioController? usuarioController;

  @override
  void initState() {
    super.initState();
    usuarioController = context.read<UsuarioController>();
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
                  TextContrasteFonte(
                    text:
                        AppLocalizations.of(context)!.login_reset_password_text,
                    semantics:
                        "Insira um email abaixo para receber o link de recuperação de senha.",
                    style: Fontes.poppins12W400Grey((Fontes.tamanhoBase)),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrasteFonte(
                    text: AppLocalizations.of(context)!.login_email,
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semantics: "Rótulo de E-mail",
                  ),
                  Semantics(
                    container: false,
                    label: "Campo obrigatório",
                    child: TextContrasteFonte(
                      text: " *",
                      style: TextStyle(
                        color: corBackgroundLaranja,
                        fontSize: Fontes.tamanhoBase.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 4,
              ),
              TextField(
                style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
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
                child: widgetBotao(
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
      widgetNotificaoPopUp(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_empty,
      );
      return;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailInput)) {
      widgetNotificaoPopUp(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_invalid,
      );
      return;
    }

    var errorMessage = await usuarioController?.sendRecoverPassword(
      email: emailInput,
    );

    if (usuarioController != null && errorMessage != "") {
      widgetNotificaoPopUp(
        context: context,
        textDescritivo: errorMessage ?? '',
      );
      return;
    }

    widgetNotificaoPopUp(
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
