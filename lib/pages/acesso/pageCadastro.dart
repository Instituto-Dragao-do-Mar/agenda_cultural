import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';

import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';

import 'package:agendacultural/shared/widgetespacoh.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/usuario_controller.dart';
import '../../model/app_model.dart';
import '../../shared/constantes.dart';
import '../../shared/widgetConfirma.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetemdesenvolvimento.dart';
import '../home/widgets/widgettopocomum.dart';

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
  UsuarioController? usuarioController;
  int haveUpperCase = 0;
  int haveLowerCase = 0;
  int haveNumber = 0;
  int haveMinDigits = 0;
  int rulesMatch = 0;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
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
        //     Navigator.pop(context);
        //   },
        //   child: widgetImagemInterna(
        //     imagem: Imagem(url: 'seta.png'),
        //   ),
        // ),
        title: widgetTopoComum(
          text: "Cadastro",
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
          labelImagem1: "Voltar para página anterior",
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
                    "Ao se cadastrar, você terá acesso aos recursos de gerar alertas e de avaliar espaços e eventos",
                semantics: "Ao se cadastrar, você terá acesso aos recursos de gerar alertas e de avaliar espaços e eventos",
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
              Semantics(
                container: false,
                label: "Campo para digitação de nome",
                child: TextField(
                  style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                  onChanged: (value) {
                    setState(() {
                      nomeInput = value;
                    });
                  },
                  decoration: textfieldDadosCadastro,
                ),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrasteFonte(
                    text: "E-mail",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semantics: "Digite seu E-mail abaixo",
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
              Semantics(
                container: false,
                label: "Campo para digitação de email",
                child: TextField(
                  style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                  onChanged: (value) {
                    setState(() {
                      emailInput = value;
                    });
                  },
                  decoration: textfieldDadosCadastro,
                ),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrasteFonte(
                    text: "Senha",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semantics: "Digite sua Senha abaixo",
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
              Semantics(
                container: false,
                label: "Campo para digitação de senha",
                child: TextField(
                  obscureText: obscureTextSenha,
                  style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                  onChanged: (value) {
                    setState(() {
                      value.characters.length >= 6
                          ? haveMinDigits = 1
                          : haveMinDigits = 0;
                      value.contains(
                        RegExp(r'[0-9]'),
                      )
                          ? haveNumber = 1
                          : haveNumber = 0;
                      value.contains(
                        RegExp(r'[a-z]'),
                      )
                          ? haveLowerCase = 1
                          : haveLowerCase = 0;
                      value.contains(
                        RegExp(r'[A-Z]'),
                      )
                          ? haveUpperCase = 1
                          : haveUpperCase = 0;

                      rulesMatch = haveUpperCase +
                          haveLowerCase +
                          haveNumber +
                          haveMinDigits;
                      senhaInput = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: senhaInput != ''
                        ? Semantics(
                          label: obscureTextSenha ? "Clique para mostrar a senha" : "Clique para ocultar a senha",
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureTextSenha = !obscureTextSenha;
                                });
                              },
                              icon: Icon(obscureTextSenha
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        )
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
              Semantics(
                container: false,
                label: "Campo para digitar novamente a senha",
                child: TextField(
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
                          style: haveMinDigits == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "No mínimo 6 dígitos",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "Pelo menos 1 letra maiúscula",
                          style: haveUpperCase == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 letra maiúscula",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "Pelo menos 1 letra minúscula",
                          style: haveLowerCase == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 letra minúscula",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: "Pelo menos 1 número",
                          style: haveNumber == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
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
                            Expanded(
                              flex: 1,
                              child: StepProgressIndicator(
                                totalSteps: 4,
                                currentStep: rulesMatch,
                                selectedColor: Colors.deepOrange,
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
                          altura: 8,
                        ),
                      ],
                    )
                  : Column(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Semantics(
                        container: false,
                        label: isChecked ? "Caixa marcada, clique duas vezes para desmarcar" : "Caixa desmarcada, clique duas vezes para marcar",
                        child: Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith((states) {
                            const Set<MaterialState> interactiveStates =
                                <MaterialState>{
                              MaterialState.pressed,
                              MaterialState.hovered,
                              MaterialState.focused,
                            };
                            if (states.any(interactiveStates.contains)) {
                              return Colors.grey;
                            }
                            return corBackgroundLaranja;
                          }),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextContrasteFonte(
                          text: "Ao se cadastrar, você concorda com os ",
                          fontsize: Fontes.tamanhoBase.toDouble(),
                          color: Color(0xff999999),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          var uri = Uri.parse(
                              "https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos");
                          if (await canLaunchUrl(uri)) {
                            // await launchUrl(uri,
                            //     mode: LaunchMode.externalApplication);
                            await launchUrl(uri,
                                mode: LaunchMode.platformDefault);
                          } else {
                            throw 'Could not launch $uri';
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            right: 2,
                          ),
                          child: TextContrasteFonte(
                            text: "Termos de Serviço",
                            color: corBackgroundLaranja,
                            fontsize: Fontes.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                      TextContrasteFonte(
                        text: " e a ",
                        fontsize: Fontes.tamanhoBase.toDouble(),
                        color: Color(0xff999999),
                      ),
                      InkWell(
                        onTap: () async {
                          var uri = Uri.parse(
                              "https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos/politica-de-privacidade");
                          if (await canLaunchUrl(uri)) {
                            // await launchUrl(uri,
                            //     mode: LaunchMode.externalApplication);
                            await launchUrl(uri,
                                mode: LaunchMode.platformDefault);
                          } else {
                            throw 'Could not launch $uri';
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            right: 2,
                          ),
                          child: TextContrasteFonte(
                            text: "Política de Privacidade",
                            color: corBackgroundLaranja,
                            fontsize: Fontes.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                      TextContrasteFonte(
                        text: " do cultura.ce.",
                        fontsize: Fontes.tamanhoBase.toDouble(),
                        color: Color(0xff999999),
                      ),
                    ],
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 16,
              ),
              Semantics(
                container: true,
                label: "Botão Cadastrar-se",
                child: widgetBotao(
                  text: "Cadastrar-se",
                  function: () async => await saveCadastro(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveCadastro() async {
    if (emailInput.characters.isEmpty ||
        nomeInput.characters.isEmpty ||
        senhaInput.characters.isEmpty) {
      return widgetMensagem(
        context: context,
        text: "Os campos precisam ser preenchidos.",
      );
    }
    if (rulesMatch != 4) {
      return widgetMensagem(
        context: context,
        text: "Senha fraca.",
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
    if (senhaInput != confirmarSenhaInput) {
      return widgetMensagem(
        context: context,
        text: "Senhas não coincidem.",
      );
    }

    if (!isChecked) {
      return widgetMensagem(
        context: context,
        text: "Por favor, aceite os Termos de Serviço.",
      );
    }

    var errorMessage = await usuarioController?.usuariosPost(
      nome: nomeInput,
      email: emailInput,
      senha: senhaInput,
    );

    if (usuarioController != null && errorMessage != "") {
      widgetMensagem(
        context: context,
        text: errorMessage ?? "",
      );
      return;
    }

    // Fluttertoast.showToast(
    //   webPosition: "top",
    //   msg: "Cadastro realizado com sucesso!",
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 3,
    //   backgroundColor: Colors.white,
    //   textColor: Colors.green,
    //   fontSize: 16.0,
    //   webBgColor: Colors.white,
    // );

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
      descricao: "Cadastro realizado."
          "Clique no botão abaixo para prosseguir para o login.",
    );

    await Future.delayed(const Duration(seconds: 1), () {});
  }
}
