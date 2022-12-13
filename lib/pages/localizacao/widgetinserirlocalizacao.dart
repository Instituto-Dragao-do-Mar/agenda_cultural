import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/localizacao/widgetlocalizacao.dart';
import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class WidgetInserirLocalizacao extends StatefulWidget {
  const WidgetInserirLocalizacao({Key? key}) : super(key: key);

  @override
  State<WidgetInserirLocalizacao> createState() =>
      _WidgetInserirLocalizacaoState();
}

class _WidgetInserirLocalizacaoState extends State<WidgetInserirLocalizacao> {
  String? nomeLocalizacao;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      minimum: const EdgeInsets.symmetric(vertical: 16),
      child: Scaffold(
        backgroundColor: corBackgroundNegative,
        appBar: AppBar(
          backgroundColor: corBackgroundNegative,
          elevation: 0,
          leadingWidth: 0,
          title: const widgetTopo(),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
          child: Column(
            children: [
              const widgetEspacoH(
                altura: 31,
              ),
              TextField(
                style: poppins16W400Grey,
                onChanged: (value) {
                  setState(() {
                    nomeLocalizacao = value;
                  });
                },
                decoration: textfieldPerfil,
              ),
              const widgetEspacoH(
                altura: 26,
              ),
              ListTile(
                leading: widgetImagemInterna(
                  imagem: Imagem(
                    url: "local.png",
                  ),
                ),
                title: Text(
                  "Usar minha localização atual",
                  style: poppins14W400E83C3B,
                ),
                onTap: () {
                  widgetErro(
                    context: context,
                    text:
                        "Funcionalidade em desenvolvimento, entre como visitante.",
                  );
                },
              ),
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
              Expanded(
                child: Column(),
              ),
              widgetBotao(
                text: "Voltar",
                function: () {
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pageLogin(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                  width: double.infinity,
                  height: 65,
                  child: Center(
                    child: Text(
                      "Ir para login",
                      semanticsLabel: "Entrar como vivitante",
                      style: roboto16W400EA5,
                    ),
                  ),
                ),
              ),
              const widgetEspacoH(
                altura: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
