// ignore_for_file: file_names

import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/acesso/pageEntrar.dart';
import 'package:agendacultural/pages/logged_area_page.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/usuario_controller.dart';
import '../../model/app_model.dart';
import '../../shared/constantes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/notify_pop_up.dart';
import '../home/general/widgettopocomum.dart';

// ignore_for_file: use_build_context_synchronously

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
  BaseController? baseController;
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
    baseController = context.read<BaseController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: widgetTopoComum(
          text: AppLocalizations.of(context)!.register_title,
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
                text: AppLocalizations.of(context)!.register_subtitle,
                semantics:
                    "Ao se cadastrar, você terá acesso aos recursos de gerar alertas e de avaliar espaços e eventos",
                style: Fontes.poppins12W400Grey((Fontes.tamanhoBase)),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Row(
                children: [
                  TextContrasteFonte(
                    text: AppLocalizations.of(context)!.register_name,
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
                    text: AppLocalizations.of(context)!.register_email,
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
                    text: AppLocalizations.of(context)!.register_password,
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
                            label: obscureTextSenha
                                ? "Clique para mostrar a senha"
                                : "Clique para ocultar a senha",
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
                      borderRadius: const BorderRadius.all(
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
                    text:
                        AppLocalizations.of(context)!.register_confirm_password,
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
                      borderRadius: const BorderRadius.all(
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
                          text: AppLocalizations.of(context)!
                              .register_password_order,
                          style: Fontes.roboto12W400Grey(Fontes.tamanhoBase),
                          semantics: "Sua senha deve conter:",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: AppLocalizations.of(context)!
                              .register_password_order_one,
                          style: haveMinDigits == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "No mínimo 6 dígitos",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: AppLocalizations.of(context)!
                              .register_password_order_two,
                          style: haveUpperCase == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 letra maiúscula",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: AppLocalizations.of(context)!
                              .register_password_order_three,
                          style: haveLowerCase == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 letra minúscula",
                        ),
                        const widgetEspacoH(
                          altura: 4,
                        ),
                        TextContrasteFonte(
                          text: AppLocalizations.of(context)!
                              .register_password_order_four,
                          style: haveNumber == 1
                              ? Fontes.roboto12W300Green(Fontes.tamanhoBase)
                              : Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                          semantics: "Pelo menos 1 número",
                        ),
                        const widgetEspacoH(
                          altura: 8,
                        ),
                        TextContrasteFonte(
                          text: AppLocalizations.of(context)!
                              .register_password_order_five,
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
                            const Expanded(
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
                  : const Column(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Semantics(
                        container: false,
                        label: isChecked
                            ? "Caixa marcada, clique duas vezes para desmarcar"
                            : "Caixa desmarcada, clique duas vezes para marcar",
                        child: Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
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
                          text:
                              AppLocalizations.of(context)!.register_terms_one,
                          fontsize: Fontes.tamanhoBase.toDouble(),
                          color: const Color(0xff999999),
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
                            text: AppLocalizations.of(context)!
                                .register_terms_two,
                            color: corBackgroundLaranja,
                            fontsize: Fontes.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                      TextContrasteFonte(
                        text:
                            AppLocalizations.of(context)!.register_terms_three,
                        fontsize: Fontes.tamanhoBase.toDouble(),
                        color: const Color(0xff999999),
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
                            text: AppLocalizations.of(context)!
                                .register_terms_four,
                            color: corBackgroundLaranja,
                            fontsize: Fontes.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                      TextContrasteFonte(
                        text: AppLocalizations.of(context)!.register_terms_five,
                        fontsize: Fontes.tamanhoBase.toDouble(),
                        color: const Color(0xff999999),
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
                  text: AppLocalizations.of(context)!.register_conclude,
                  function:
                      (usuarioController!.state == ControllerStates.loading)
                          ? null
                          : () async => await saveCadastro(),
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
    if (rulesMatch != 4) {
      notifyPopUpWidget(
        context: context,
        textDescritivo:
            AppLocalizations.of(context)!.registern_notify_weak_password,
      );
      return;
    }
    if (senhaInput != confirmarSenhaInput) {
      notifyPopUpWidget(
        context: context,
        textDescritivo:
            AppLocalizations.of(context)!.register_notify_different_passwords,
      );
      return;
    }

    if (!isChecked) {
      notifyPopUpWidget(
        context: context,
        textDescritivo:
            AppLocalizations.of(context)!.register_notify_accept_terms,
      );
      return;
    }

    var errorMessage = await usuarioController?.usuariosPost(
      nome: nomeInput,
      email: emailInput,
      senha: senhaInput,
    );

    if (usuarioController != null && errorMessage != "") {
      notifyPopUpWidget(
          context: context, textDescritivo: errorMessage ?? '');
      return;
    }

    notifyPopUpWidget(
        context: context,
        textChamativo:
            AppLocalizations.of(context)!.register_notify_register_conclude,
        textDescritivo: AppLocalizations.of(context)!
            .register_notify_register_conclude_text,
        textBotao: AppLocalizations.of(context)!.int_button_enter,
        erro: false,
        funcaoBotao: () async {
          final user = await usuarioController?.login(
            app: app,
            email: emailInput,
            senha: senhaInput,
            alterarSenha: false,
          );

          app?.usuarioLogado ??= user;
          baseController?.setBottomBarSelectedOption(0);

          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoggedAreaPage(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PageEntrar(),
              ),
            );
          }
        });
    return;
  }
}
