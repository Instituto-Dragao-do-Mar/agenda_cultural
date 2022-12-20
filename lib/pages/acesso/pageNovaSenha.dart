import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../model/fontes.dart';
import '../../shared/themes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetbotao.dart';
import '../../shared/widgetespacoh.dart';
import '../home/widgets/widgettopocomum.dart';

class PageNovaSenha extends StatefulWidget {
  const PageNovaSenha({Key? key}) : super(key: key);

  @override
  State<PageNovaSenha> createState() => _PageNovaSenhaState();
}

class _PageNovaSenhaState extends State<PageNovaSenha> {
  String senhaInput = "";
  String confirmarSenhaInput = "";
  bool obscureTextSenha = true;
  bool obscureTextNovaSenha = true;
  int haveUpperCase = 0;
  int haveLowerCase = 0;
  int haveNumber = 0;
  int haveMinDigits = 0;
  int rulesMatch = 0;

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
                    "Insira uma nova senha. ",
                    semantics:
                    "Insira uma nova senha.",
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
                    text: "Nova Senha",
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
              ),TextField(
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
              const widgetEspacoH(
                altura: 15,
              ),
              Semantics(
                container: true,
                label: "Botão Salvar",
                child: widgetBotao(
                  text: "Salvar",
                  function: () {

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
