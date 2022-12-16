import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../controller/usuario_controller.dart';
import '../../model/app_model.dart';
import '../../shared/constantes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetemdesenvolvimento.dart';
import '../home/widgets/widgettopocomum.dart';
import '../home/widgets/widgettopoperfil.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({Key? key}) : super(key: key);

  @override
  State<PageCadastro> createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {
  String nomeInput = "";
  String emailInput = "";
  String senhaInput = "";
  String confirmarSenhaInput = "";
  bool obscureTextSenha = true;
  bool obscureTextNovaSenha = true;
  AppModel? app;

  @override
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
          text: "Cadastro",
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
              TextContrasteFonte(
                text:
                    "Ao se cadastrar você terá acesso aos recursos de gerar alertas e avaliar espaços e eventos",
                semantics: "Cadastro",
                style: Fontes.poppins12W400Grey((Fontes.tamanhoBase)),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrasteFonte(
                    text: "Nome",
                    semantics: "Digite seu Nome",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
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
                    nomeInput = value;
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
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: .5,
                      color: Color(0XFFD9D9D9),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: corBackgroundLaranja,
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
              Row(
                children: [
                  TextContrasteFonte(
                    text: "Confirmar Senha",
                    semantics: "Digite sua senha novamente",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
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
                autofocus: false,
                obscureText: obscureTextNovaSenha,
                style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                onChanged: (value) {
                  setState(() {
                    confirmarSenhaInput = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                  contentPadding: const EdgeInsets.all(16),
                  suffixIcon: confirmarSenhaInput != ''
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              obscureTextNovaSenha = !obscureTextNovaSenha;
                            });
                          },
                          icon: Icon(
                            obscureTextNovaSenha
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )
                      : null,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: .5,
                      color: Color(0XFFD9D9D9),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: corBackgroundLaranja,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const widgetEspacoH(
                altura: 16,
              ),
              senhaInput != "" || confirmarSenhaInput != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextContrasteFonte(
                          text: "Sua senha deve conter:",
                          style: Fontes.roboto12W400Grey(Fontes.tamanhoBase),
                          semantics: "Sua senha deve conter:",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "No mínimo 6 dígitos",
                          style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "No mínimo 6 dígitos",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "Pelo menos 1 letra maiúscula",
                          style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 letra maiúscula",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "Pelo menos 1 letra minúscula",
                          style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 letra minúscula",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "Pelo menos 1 número",
                          style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 número",
                        ),
                        const widgetEspacoH(
                          altura: 8,
                        ),
                        TextContrasteFonte(
                          text: "Força da senha:",
                          style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Força da senha:",
                        ),
                        const widgetEspacoH(
                          altura: 8,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: StepProgressIndicator(
                                totalSteps: 4,
                                currentStep: 0,
                                selectedColor: Colors.red,
                                unselectedColor: Colors.grey,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(),
                            )
                          ],
                        ),
                        const widgetEspacoH(
                          altura: 16,
                        )
                      ],
                    )
                  : Column(),
              Semantics(
                container: true,
                label: "Botão Salvar",
                child: widgetBotao(
                  text: "Salvar",
                  function: () async => await saveCadastro(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveCadastro() async {
    if (emailInput.characters.length == 0 ||
        nomeInput.characters.length == 0 ||
        senhaInput.characters.length == 0) {
      widgetErro(
        context: context,
        text: "Os campos precisam ser preenchidos.",
      );
    } else if (senhaInput != confirmarSenhaInput) {
      widgetErro(
        context: context,
        text: "Senhas não conferem.",
      );
    } else {
      var usuario = await UsuarioController().usuariosPost(
        nome: nomeInput,
        email: emailInput,
        senha: senhaInput,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const pageLogin(),
        ),
      );
    }
  }
}
