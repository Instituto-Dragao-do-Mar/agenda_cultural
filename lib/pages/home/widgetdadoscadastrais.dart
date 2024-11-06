// ignore_for_file: camel_case_types, library_private_types_in_public_api, use_build_context_synchronously

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/app_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class widgetDadosCadastrais extends StatefulWidget {
  const widgetDadosCadastrais({Key? key}) : super(key: key);

  @override
  _widgetDadosCadastraisState createState() => _widgetDadosCadastraisState();
}

class _widgetDadosCadastraisState extends State<widgetDadosCadastrais> {
  String nomeInput = "";
  String emailInput = "";
  AppModel? app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    nomeInput = app?.usuarioLogado?.nome ?? "";
    emailInput = app?.usuarioLogado?.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          semanticsLabel: "Tela de Dados Cadastrais. Se desejar, "
              "é possível alterar a senha nesta tela.",
          text: AppLocalizations.of(context)!.profile_account_data,
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
              Text(
                AppLocalizations.of(context)!.profile_account_data,
                semanticsLabel: "Dados cadastrais do usuário",
                style: Fontes.poppins18W500Black((Fontes.tamanhoBase)),
              ),
              const widgetEspacoH(
                altura: 15,
              ),
              Text(
                AppLocalizations.of(context)!.register_name,
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
                AppLocalizations.of(context)!.register_email,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: WidgetBottomNavigator(),
    );
  }
}
