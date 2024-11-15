// ignore_for_file: must_be_immutable

import 'package:agendacultural/controller/notificacao_controller.dart';
import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pageCadastro.dart';
import 'package:agendacultural/pages/acesso/pageNovaSenha.dart';
import 'package:agendacultural/pages/acesso/pageRecuperarSenha.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../model/app_model.dart';
import '../../model/cores.dart';
import '../../shared/constantes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/notify_pop_up.dart';
import '../home/general/widgettopocomum.dart';
import '../../modules/logged/presenter/page/logged_area_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore_for_file: use_build_context_synchronously

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
  late final UsuarioController usuarioController;

  void initState() {
    super.initState();
    app = context.read<AppModel>();
    emailInput = app.usuarioLogado?.email ?? "";
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
        title: widgetTopoComum(
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
          labelImagem1: "Voltar para página anterior",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widgetImagemInterna(
                imagem: Imagem(url: 'iconelaranha.png'),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              const widgetEspacoH(
                altura: 5,
              ),
              TextContrasteFonte(
                text: AppLocalizations.of(context)!.login_enter,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: Fontes.tamanhoBase + 8,
                    fontWeight: FontWeight.w500,
                    color: !Cores.contraste ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextContrasteFonte(
                    text: AppLocalizations.of(context)!.login_text,
                    semantics:
                        "Para entrar é necessário que você tenha se cadastrado no nosso aplicativo .",
                    style: Fontes.poppins12W400Grey((Fontes.tamanhoBase)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageCadastro(),
                        ),
                      );
                    },
                    child: TextContrasteFonte(
                      text: AppLocalizations.of(context)!.register,
                      semantics: "Cadastre-se!",
                      style: TextStyle(
                        color: corBackgroundLaranja,
                        fontSize: Fontes.tamanhoBase.toDouble(),
                      ),
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
              Semantics(
                label: "Campo para digitação de email",
                child: TextFormField(
                  initialValue: emailInput,
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
                    text: AppLocalizations.of(context)!.login_password,
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semantics: "Rótulo de Senha",
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
                label: "Campo para digitação de senha",
                child: TextField(
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
                altura: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageRecuperarSenha(),
                        ),
                      );
                    },
                    child: TextContrasteFonte(
                      text: AppLocalizations.of(context)!.login_reset_password,
                      semantics: "Esqueci minha senha",
                      style: TextStyle(
                        color: corBackgroundLaranja,
                        fontSize: Fontes.tamanhoBase.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
              const widgetEspacoH(
                altura: 20,
              ),
              Semantics(
                container: true,
                label: "Botão Entrar",
                child: widgetBotao(
                  text: AppLocalizations.of(context)!.login_enter,
                  function: () async => await sendLogin(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendLogin(BuildContext context) async {
    await usuarioController.login(
        app: app, email: emailInput, senha: senhaInput);
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailInput)) {
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_invalid,
      );
      return;
    }

    if (usuarioController.errorMessage == "Alterar Senha") {
      notifyPopUpWidget(
          context: context,
          textDescritivo: AppLocalizations.of(context)!.login_notify_reset,
          textBotao: AppLocalizations.of(context)!.login_notify_reset_button,
          funcaoBotao: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PageNovaSenha(),
              ),
            );
          });
      return;
    }

    if (app.isLog()) {
      app.listaNotificacoes = await NotificacaoController().NotificacaoGet(
        userguidid: app.GetGuidId(),
        token: app.GetToken(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoggedAreaPage(),
        ),
      );
    } else {
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_data_invalid,
      );
    }
  }
}
