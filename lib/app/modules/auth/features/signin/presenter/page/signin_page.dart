import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/model/colors.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/button_default.dart';
import 'package:agendacultural/pages/acesso/pageCadastro.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/pages/acesso/pageRecuperarSenha.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/page/widgets/signin_app_bar.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/handler/signin_state_handler.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SigninPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: corBgAtual,
          appBar: const SigninAppBar(),
          body: Container(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'imagens/icon_idm_orange.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  TextContrastFont(
                    text: AppLocalizations.of(context)!.login_enter,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: FontsApp.tamanhoBase + 8,
                        fontWeight: FontWeight.w500,
                        color: !ColorsApp.contraste ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextContrastFont(
                        text: AppLocalizations.of(context)!.login_text,
                        semantics: 'Para entrar é necessário que você tenha se cadastrado no nosso aplicativo.',
                        style: FontsApp.poppins12W400Grey((FontsApp.tamanhoBase)),
                        maxlines: 3,
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
                        child: TextContrastFont(
                          text: AppLocalizations.of(context)!.register,
                          semantics: 'Cadastre-se!',
                          style: TextStyle(
                            color: corBackgroundLaranja,
                            fontSize: FontsApp.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      TextContrastFont(
                        text: AppLocalizations.of(context)!.login_email,
                        style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                        semantics: AppLocalizations.of(context)!.login_email,
                      ),
                      TextContrastFont(
                        text: ' *',
                        style: TextStyle(color: corBackgroundLaranja, fontSize: FontsApp.tamanhoBase.toDouble()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Semantics(
                    label: 'Campo para digitação de email',
                    child: TextFormField(
                      style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                      onChanged: (value) => _handler.store.setEmail(value),
                      cursorColor: const Color(0xFF2E3132),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(16),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      TextContrastFont(
                        text: AppLocalizations.of(context)!.login_password,
                        style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                        semantics: AppLocalizations.of(context)!.login_password,
                      ),
                      TextContrastFont(
                        text: ' *',
                        style: TextStyle(color: corBackgroundLaranja, fontSize: FontsApp.tamanhoBase.toDouble()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Semantics(
                    label: 'Campo para digitação de senha',
                    child: TextField(
                      obscureText: _handler.store.obscureText,
                      style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                      onChanged: (value) => _handler.store.setPassword(value),
                      cursorColor: const Color(0xFF2E3132),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(16),
                        suffixIcon: _handler.store.password != ''
                            ? Semantics(
                                label: _handler.store.obscureText
                                    ? 'Clique para mostrar a senha'
                                    : 'Clique para ocultar a senha',
                                child: IconButton(
                                  onPressed: () => _handler.store.setObscureText(!_handler.store.obscureText),
                                  icon: Icon(
                                    _handler.store.obscureText ? Icons.visibility : Icons.visibility_off,
                                  ),
                                ),
                              )
                            : null,
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
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
                        child: TextContrastFont(
                          text: AppLocalizations.of(context)!.login_reset_password,
                          semantics: 'Esqueci minha senha',
                          style: TextStyle(
                            color: corBackgroundLaranja,
                            fontSize: FontsApp.tamanhoBase.toDouble(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Semantics(
                    container: true,
                    label: 'Botão Entrar',
                    child: ButtonDefault(
                      text: AppLocalizations.of(context)!.login_enter,
                      function: () async => await _handler.sendLogin(context, mounted),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
