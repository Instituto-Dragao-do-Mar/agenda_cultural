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
        appBar: AppBar(
          backgroundColor: corBackgroundNegative,
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
          backgroundColor: corBackgroundNegative,
          elevation: 0,
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.grey,
          currentIndex: opcaoSelecionada,
          items: [
            BottomNavigationBarItem(
              backgroundColor: corBackgroundNegative,
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomhome.png',
              )),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomcalendario.png',
              )),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottommapa.png',
              )),
              label: "Mapa",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomfavoritos.png',
              )),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: './imagens/bottomperfil.png',
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
                  style: poppins18W500Black,
                ),
                const widgetEspacoH(
                  altura: 15,
                ),
                Text(
                  "Nome",
                  style: poppins16W400Black,
                ),
                const widgetEspacoH(
                  altura: 4,
                ),
                TextField(
                  style: poppins16W400Grey,
                  onChanged: (value) {
                    setState(() {
                      nomeInput = value;
                    });
                  },
                  decoration: textfieldPerfil,
                ),
                const widgetEspacoH(
                  altura: 15,
                ),
                Text(
                  "E-mail",
                  style: poppins16W400Black,
                ),
                const widgetEspacoH(
                  altura: 4,
                ),
                TextField(
                  style: poppins16W400Grey,
                  onChanged: (value) {
                    setState(() {
                      emailInput = value;
                    });
                  },
                  decoration: textfieldPerfil,
                ),
                const widgetEspacoH(
                  altura: 15,
                ),
                Text(
                  "Senha atual",
                  style: poppins16W400Black,
                ),
                const widgetEspacoH(
                  altura: 4,
                ),
                TextField(
                  obscureText: obscureTextSenha,
                  style: poppins16W400Grey,
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
                  style: poppins16W400Black,
                ),
                const widgetEspacoH(
                  altura: 4,
                ),
                TextField(
                  autofocus: false,
                  obscureText: obscureTextNovaSenha,
                  style: poppins16W400Grey,
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
                            style: roboto12W400Grey,
                            semanticsLabel: "Sua senha deve conter:",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "No mínimo 6 dígitos",
                            style: roboto12W300Grey,
                            semanticsLabel: "No mínimo 6 dígitos",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "Pelo menos 1 letra maiúscula",
                            style: roboto12W300Grey,
                            semanticsLabel: "Pelo menos 1 letra maiúscula",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "Pelo menos 1 letra minúscula",
                            style: roboto12W300Grey,
                            semanticsLabel: "Pelo menos 1 letra minúscula",
                          ),
                          const widgetEspacoH(
                            altura: 4,
                          ),
                          Text(
                            "Pelo menos 1 número",
                            style: roboto12W300Grey,
                            semanticsLabel: "Pelo menos 1 número",
                          ),
                          const widgetEspacoH(
                            altura: 8,
                          ),
                          Text(
                            "Força da senha:",
                            style: roboto12W300Grey,
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
                const widgetBotao(text: "Salvar")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
