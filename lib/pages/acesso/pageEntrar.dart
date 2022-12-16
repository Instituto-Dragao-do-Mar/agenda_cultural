import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../../model/app_model.dart';
import '../../shared/constantes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetemdesenvolvimento.dart';
import '../home/widgethome.dart';
import '../home/widgets/widgettopocomum.dart';
import '../home/widgets/widgettopoperfil.dart';
import '../principal/home.dart';

class PageEntrar extends StatefulWidget {
  const PageEntrar({Key? key}) : super(key: key);

  @override
  State<PageEntrar> createState() => _PageEntrarState();
}

class _PageEntrarState extends State<PageEntrar> {
  String emailInput = "";
  String senhaInput = "";
  bool obscureTextSenha = true;
  late final AppModel app;

  void initState() {
    super.initState();
    app = context.read<AppModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          funcaoImagem1: () async {},
          urlImagem1: 'seta.png',
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
                        "Para entrar é necessário que você tenha se cadastrado no nosso aplicativo. ",
                    semantics:
                        "Para entrar é necessário que você tenha se cadastrado no nosso aplicativo.",
                    style: Fontes.poppins12W400Grey((Fontes.tamanhoBase)),
                  ),
                  TextContrasteFonte(
                    text: "Cadastre-se!",
                    semantics: "Cadastre-se!",
                    style: TextStyle(
                      color: corBackgroundLaranja,
                      fontSize: Fontes.tamanhoBase.toDouble(),
                    ),
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
                    semantics: "Digite seu E-mail",
                  ),
                  TextContrasteFonte(
                    text: " *",
                    style: TextStyle(
                      color: corBackgroundLaranja,
                      fontSize: Fontes.tamanhoBase.toDouble(),
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
              Row(
                children: [
                  TextContrasteFonte(
                    text: "Senha",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semantics: "Digite sua Senha",
                  ),
                  TextContrasteFonte(
                    text: " *",
                    style: TextStyle(
                      color: corBackgroundLaranja,
                      fontSize: Fontes.tamanhoBase.toDouble(),
                    ),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 4,
              ),
              TextField(
                obscureText: obscureTextSenha,
                style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                onChanged: (value) {
                  setState(() {
                    senhaInput = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                  contentPadding: const EdgeInsets.all(16),
                  suffixIcon: senhaInput != ''
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextSenha = !obscureTextSenha;
                            });
                          },
                          icon: Icon(obscureTextSenha
                              ? Icons.visibility
                              : Icons.visibility_off))
                      : null,
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: corBackgroundLaranja,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0XFFD9D9D9),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Semantics(
                container: true,
                label: "Botão Salvar",
                child: widgetBotao(
                  text: "Salvar",
                  function: () async => await sendLogin(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendLogin() async {
    var usuario = await UsuarioController()
        .login(app: app, email: emailInput, senha: senhaInput);
    if (app.isLog()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const pagePrincipal(),
        ),
      );
    } else widgetErro(
      context: context,
      text:
      "Dados incorretos, verifique o email e senha e tente novamente.",
    );
  }
}
