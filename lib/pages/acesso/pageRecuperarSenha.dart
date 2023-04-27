import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/pages/acesso/pageEntrar.dart';
import 'package:agendacultural/pages/acesso/pageNovaSenha.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/shared/widgetConfirma.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/app_model.dart';
import '../../model/fontes.dart';
import '../../shared/constantes.dart';
import '../../shared/themes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetbotao.dart';
import '../../shared/widgetemdesenvolvimento.dart';
import '../../shared/widgetespacoh.dart';
import '../home/widgets/widgettopocomum.dart';

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
                        "Insira um email para receber o link de recuperação de senha.",
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
                    text: "E-mail",
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
                    text: "Enviar",
                    function: () async => {
                          await sendEmail(),
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    if (emailInput.characters.length == 0) {
      return widgetMensagem(
        context: context,
        text: "Os campos precisam ser preenchidos.",
      );
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailInput)) {
      return widgetMensagem(
        context: context,
        text: "Email inválido.",
      );
    }

    var errorMessage = await usuarioController?.sendRecoverPassword(
      email: emailInput,
    );

    if (usuarioController != null && errorMessage != "") {
      return widgetMensagem(
        context: context,
        text: errorMessage ?? "",
      );
    }

    return widgetMensagem(
      context: context,
      title: "Email enviado com sucesso.",
      text: "Verifique seu "
          "email para saber sua nova senha.",
      funcaoSim: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const pageLogin(),
          ),
        );
      },
      buttonText: "Entrar"
    );

    return widgetConfirma(
      context: context,
      funcaoSim: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const pageLogin(),
          ),
        );
      },
      cancelar: false,
      textBotao: "Entrar",
      descricao: "Email enviado com sucesso. Verifique seu "
          "email para saber sua nova senha.",
    );
  }
}
