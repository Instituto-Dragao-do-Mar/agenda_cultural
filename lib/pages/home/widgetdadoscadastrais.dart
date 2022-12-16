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

import '../../shared/constantes.dart';
import 'widgethome.dart';
import 'widgets/widgettopoperfil.dart';

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

  List<Widget> subPaginas = [
    const widgetHome(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    widgetPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      minimum: const EdgeInsets.symmetric(vertical: 16),
      child: Scaffold(
        backgroundColor: corBgAtual,
        appBar: AppBar(
          backgroundColor: corBgAtual,
          elevation: 0,
          leadingWidth: 0,
          title: const widgetTopoPerfil(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              opcaoSelecionada = i;
            });
          },
          backgroundColor: corBgAtual,
          elevation: 0,
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.grey,
          currentIndex: opcaoSelecionada,
          items: [
            BottomNavigationBarItem(
              backgroundColor: corBgAtual,
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomhome.png',
              )),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: corBgAtual,
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomcalendario.png',
              )),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              backgroundColor: corBgAtual,
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottommapa.png',
              )),
              label: "Mapa",
            ),
            BottomNavigationBarItem(
              backgroundColor: corBgAtual,
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomfavoritos.png',
              )),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              backgroundColor: corBgAtual,
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomperfil.png',
              )),
              label: "Perfil",
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dados cadastrais",
                  semanticsLabel: "Dados cadastrais",
                  style: Fontes.poppins18W500Black((Fontes.tamanhoBase)),
                ),
                const widgetEspacoH(
                  altura: 15,
                ),
                Text(
                  "Nome",
                  semanticsLabel: "Digite seu Nome",
                  style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
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
                Text(
                  "E-mail",
                  style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                  semanticsLabel: "Digite seu E-mail",
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
                Text("Senha atual",
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    semanticsLabel: "Digite sua Senha atual"),
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
                  ),
                ),
                const widgetEspacoH(
                  altura: 15,
                ),
                Text(
                  "Nova senha",
                  semanticsLabel: "Digite sua nova senha",
                  style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
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
                      novaSenhaInput = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                    contentPadding: const EdgeInsets.all(16),
                    suffixIcon: novaSenhaInput != ''
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
                  ),
                ),
                const widgetEspacoH(
                  altura: 16,
                ),
                senhaInput != "" || novaSenhaInput != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sua senha deve conter:",
                            style: Fontes.roboto12W400Grey(Fontes.tamanhoBase),
                            semanticsLabel: "Sua senha deve conter:",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "No mínimo 6 dígitos",
                            style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                            semanticsLabel: "No mínimo 6 dígitos",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "Pelo menos 1 letra maiúscula",
                            style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                            semanticsLabel: "Pelo menos 1 letra maiúscula",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "Pelo menos 1 letra minúscula",
                            style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                            semanticsLabel: "Pelo menos 1 letra minúscula",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "Pelo menos 1 número",
                            style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                            semanticsLabel: "Pelo menos 1 número",
                          ),
                          const widgetEspacoH(
                            altura: 8,
                          ),
                          Text(
                            "Força da senha:",
                            style: Fontes.roboto12W300Grey(Fontes.tamanhoBase),
                            semanticsLabel: "Força da senha:",
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
                  child: const widgetBotao(
                    text: "Salvar",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
