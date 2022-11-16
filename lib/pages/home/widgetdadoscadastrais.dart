import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../shared/constantes.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
              decoration:textfieldPerfil, 
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
            Text(
              "Sua senha deve conter:",
              style: roboto12W400Grey,
            ),
            const widgetEspacoH(
              altura: 4,
            ),
            Text(
              "No mínimo 6 dígitos",
              style: roboto12W300Grey,
            ),
            const widgetEspacoH(
              altura: 4,
            ),
            Text(
              "Pelo menos 1 letra maiúscula",
              style: roboto12W300Grey,
            ),
            const widgetEspacoH(
              altura: 4,
            ),
            Text(
              "Pelo menos 1 letra minúscula",
              style: roboto12W300Grey,
            ),
            const widgetEspacoH(
              altura: 4,
            ),
            Text(
              "Pelo menos 1 número",
              style: roboto12W300Grey,
            ),
            const widgetEspacoH(
              altura: 8,
            ),
            Text(
              "Força da senha:",
              style: roboto12W300Grey,
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
            ),
            const widgetBotao(text: "Salvar")
          ],
        ),
      ),
    );
  }
}
