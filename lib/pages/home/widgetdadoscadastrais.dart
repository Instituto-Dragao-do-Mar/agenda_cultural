// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../controller/usuario_controller.dart';
import '../../model/app_model.dart';
import '../../shared/widgetemdesenvolvimento.dart';
import 'widgethome.dart';

class widgetDadosCadastrais extends StatefulWidget {
  const widgetDadosCadastrais({Key? key}) : super(key: key);

  @override
  _widgetDadosCadastraisState createState() => _widgetDadosCadastraisState();
}

class _widgetDadosCadastraisState extends State<widgetDadosCadastrais> {
  String nomeInput = "";
  String emailInput = "";
  String senhaInput = "";
  String novaSenhaInput = "";
  bool obscureTextSenha = true;
  bool obscureTextNovaSenha = true;
  int opcaoSelecionada = 0;
  AppModel? app;
  UsuarioController? usuarioController;
  int haveUpperCase = 0;
  int haveLowerCase = 0;
  int haveNumber = 0;
  int haveMinDigits = 0;
  int rulesMatch = 0;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    usuarioController = context.read<UsuarioController>();
    nomeInput = app?.usuarioLogado?.nome ?? "";
    emailInput = app?.usuarioLogado?.email ?? "";
  }

  List<Widget> subPaginas = [
    const widgetHome(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          semanticsLabel: "Tela de Dados Cadastrais. Se desejar, é possível alterar a senha nesta tela.",
          text: "Dados Cadastrais",
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
              Text(
                "Dados cadastrais",
                semanticsLabel: "Dados cadastrais do usuário",
                style: Fontes.poppins18W500Black((Fontes.tamanhoBase)),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Text(
                "Nome",
                semanticsLabel: "Nome",
                style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
              ),
              const widgetEspacoH(
                altura: 4,
              ),
              Semantics(
                container: false,
                label: "Nome do usuário $nomeInput",
                child: TextField(
                  style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                  enabled: false,
                  // onChanged: (value) {
                  //   setState(() {
                  //     nomeInput = value;
                  //   });
                  // },
                  decoration: InputDecoration(
                    hintText: nomeInput,
                    filled: true,
                    fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                    contentPadding: const EdgeInsets.all(16),
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
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Text(
                "E-mail",
                style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                semanticsLabel: "E-mail",
              ),
              const widgetEspacoH(
                altura: 4,
              ),
              Semantics(
                container: false,
                label: "Email do usuário $emailInput",
                child: TextField(
                  style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                  enabled: false,
                  // onChanged: (value) {
                  //   setState(() {
                  //     emailInput = value;
                  //   });
                  // },
                  decoration: InputDecoration(
                    hintText: emailInput,
                    filled: true,
                    fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                    contentPadding: const EdgeInsets.all(16),
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
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              // Text(
              //   "Senha atual",
              //   style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
              //   semanticsLabel: "Senha atual",
              // ),
              // const widgetEspacoH(
              //   altura: 4,
              // ),
              // Semantics(
              //   child: TextField(
              //     obscureText: obscureTextSenha,
              //     style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
              //     onChanged: (value) {
              //       setState(() {
              //         senhaInput = value;
              //       });
              //     },
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
              //       contentPadding: const EdgeInsets.all(16),
              //       suffixIcon: senhaInput != ''
              //           ? IconButton(
              //               onPressed: () {
              //                 setState(() {
              //                   obscureTextSenha = !obscureTextSenha;
              //                 });
              //               },
              //               icon: Icon(obscureTextSenha
              //                   ? Icons.visibility
              //                   : Icons.visibility_off))
              //           : null,
              //       focusColor: Colors.black,
              //       border: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           width: .5,
              //           color: Color(0XFFD9D9D9),
              //         ),
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(5),
              //         ),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           width: 3,
              //           color: corBackgroundLaranja,
              //         ),
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(5),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const widgetEspacoH(
              //   altura: 15,
              // ),
              // Text(
              //   "Nova senha",
              //   semanticsLabel: "Nova senha",
              //   style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
              // ),
              // const widgetEspacoH(
              //   altura: 4,
              // ),
              // Semantics(
              //   label: "Campo de Nova Senha",
              //   child: TextField(
              //     autofocus: false,
              //     obscureText: obscureTextNovaSenha,
              //     style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
              //     onChanged: (value) {
              //       setState(() {
              //         value.characters.length >= 6
              //             ? haveMinDigits = 1
              //             : haveMinDigits = 0;
              //         value.contains(
              //           RegExp(r'[0-9]'),
              //         )
              //             ? haveNumber = 1
              //             : haveNumber = 0;
              //         value.contains(
              //           RegExp(r'[a-z]'),
              //         )
              //             ? haveLowerCase = 1
              //             : haveLowerCase = 0;
              //         value.contains(
              //           RegExp(r'[A-Z]'),
              //         )
              //             ? haveUpperCase = 1
              //             : haveUpperCase = 0;
              //
              //         rulesMatch = haveUpperCase +
              //             haveLowerCase +
              //             haveNumber +
              //             haveMinDigits;
              //         novaSenhaInput = value;
              //       });
              //     },
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
              //       contentPadding: const EdgeInsets.all(16),
              //       suffixIcon: novaSenhaInput != ''
              //           ? IconButton(
              //               onPressed: () {
              //                 setState(() {
              //                   obscureTextNovaSenha = !obscureTextNovaSenha;
              //                 });
              //               },
              //               icon: Icon(
              //                 obscureTextNovaSenha
              //                     ? Icons.visibility
              //                     : Icons.visibility_off,
              //               ),
              //             )
              //           : null,
              //       border: const OutlineInputBorder(
              //         borderSide: BorderSide(
              //           width: .5,
              //           color: Color(0XFFD9D9D9),
              //         ),
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(5),
              //         ),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           width: 3,
              //           color: corBackgroundLaranja,
              //         ),
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(5),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const widgetEspacoH(
              //   altura: 16,
              // ),
              // novaSenhaInput != ""
              //     ? Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           TextContrasteFonte(
              //             text: "Sua senha deve conter:",
              //             style: Fontes.roboto12W400Grey(Fontes.tamanhoBase),
              //             semantics: "Sua senha deve conter:",
              //           ),
              //           const widgetEspacoH(
              //             altura: 4,
              //           ),
              //           TextContrasteFonte(
              //             text: "No mínimo 6 dígitos",
              //             style: haveMinDigits == 1
              //                 ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
              //                 : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
              //             semantics: "No mínimo 6 dígitos",
              //           ),
              //           const widgetEspacoH(
              //             altura: 4,
              //           ),
              //           TextContrasteFonte(
              //             text: "Pelo menos 1 letra maiúscula",
              //             style: haveUpperCase == 1
              //                 ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
              //                 : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
              //             semantics: "Pelo menos 1 letra maiúscula",
              //           ),
              //           const widgetEspacoH(
              //             altura: 4,
              //           ),
              //           TextContrasteFonte(
              //             text: "Pelo menos 1 letra minúscula",
              //             style: haveLowerCase == 1
              //                 ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
              //                 : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
              //             semantics: "Pelo menos 1 letra minúscula",
              //           ),
              //           const widgetEspacoH(
              //             altura: 4,
              //           ),
              //           TextContrasteFonte(
              //             text: "Pelo menos 1 número",
              //             style: haveNumber == 1
              //                 ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
              //                 : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
              //             semantics: "Pelo menos 1 número",
              //           ),
              //           const widgetEspacoH(
              //             altura: 8,
              //           ),
              //           TextContrasteFonte(
              //             text: "Força da senha:",
              //             style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
              //             semantics: "Força da senha:",
              //           ),
              //           const widgetEspacoH(
              //             altura: 8,
              //           ),
              //           Row(
              //             children: [
              //               Expanded(
              //                 flex: 1,
              //                 child: StepProgressIndicator(
              //                   totalSteps: 4,
              //                   currentStep: rulesMatch,
              //                   selectedColor: Colors.deepOrange,
              //                   unselectedColor: Colors.grey,
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Row(),
              //               )
              //             ],
              //           ),
              //           const widgetEspacoH(
              //             altura: 8,
              //           ),
              //         ],
              //       )
              //     : Column(),
              // Semantics(
              //   container: true,
              //   label: "Botão Salvar",
              //   child: widgetBotao(
              //     text: "Salvar",
              //     function: () async => await savePassword(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> savePassword() async {
    Fluttertoast.showToast(
      msg: "Senha atualizada com sucesso!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black,
      textColor: Colors.green,
      fontSize: 16.0,
      webBgColor: Colors.black,
    );

    if (senhaInput.characters.isEmpty || novaSenhaInput.characters.isEmpty) {
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

    await usuarioController?.login(
        app: app, email: emailInput, senha: senhaInput, alterarSenha: true);

    var loginErrorMessage = usuarioController?.errorMessage;

    if (loginErrorMessage == "Usuário e/ou senha incorretos") {
      return widgetMensagem(
        context: context,
        text: "Senha incorreta",
      );
    }

    var errorMessage = await usuarioController?.usuariosPost(
      nome: nomeInput,
      email: emailInput,
      senha: senhaInput,
    );

    if (usuarioController != null && errorMessage != "") {
      return widgetMensagem(
        context: context,
        text: errorMessage ?? "",
      );
    }

    Fluttertoast.showToast(
      webPosition: "top",
      msg: "Senha atualizada com sucesso!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.white,
      textColor: Colors.green,
      fontSize: 16.0,
      webBgColor: Colors.white,
    );

    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const widgetPerfil(),
      //   ),
      // );
    });
  }
}
