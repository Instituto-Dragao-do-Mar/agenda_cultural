// ignore_for_file: camel_case_types

import 'package:agendacultural/app/modules/logged/presenter/page/logged_area_page.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pageCadastro.dart';
import 'package:agendacultural/pages/acesso/pageEntrar.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/button_default.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/app_model.dart';
import '../../model/colors.dart';
import '../../model/fonts.dart';
import '../../shared/text_contrast_font.dart';

class pageLogin extends StatefulWidget {
  const pageLogin({super.key});

  @override
  State<pageLogin> createState() => _pageLoginState();
}

class _pageLoginState extends State<pageLogin> {
  final ScrollController scrollController = ScrollController();
  AppModel? app;
  late HttpClient baseController;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    baseController = context.read<HttpClient>();
  }

  @override
  Widget build(BuildContext context) {
    app?.resetUser(notify: false);

    return Scaffold(
      backgroundColor: corBgAtual,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 65.0, bottom: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextContrastFont(
                    text: "", //Realização
                    style: FontsApp.roboto16W400Black(FontsApp.tamanhoBase),
                    semantics: "Realização Governo do Estado do Ceará.",
                  ),
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: "realizacaogov.png",
                    ),
                    width: 303.2, //277
                    height: 49.8, //277
                  ),
                ],
              ),
              const widgetEspacoH(altura: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Semantics(
                      container: true,
                      label: "Logo do Cultura cê é, Agenda Cultural do Ceará",
                      child: widgetImagemInterna(
                        width: 402, //247,
                        height: 299, //224
                        imagem: Imagem(
                          url: 'logotelaloginnovo.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const widgetEspacoH(altura: 44),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonDefault(
                        margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                        text: AppLocalizations.of(context)!.login_enter,
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageEntrar(),
                            ),
                          );
                        },
                      ),
                      ButtonDefault(
                        margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                        text: AppLocalizations.of(context)!.register,
                        negative: true,
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageCadastro(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoggedAreaPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                          width: double.infinity,
                          height: 35,
                          child: Center(
                            child: TextContrastFont(
                              text: AppLocalizations.of(context)!.visitor,
                              semantics: "Entrar como visitante",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: corBackgroundLaranja,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const widgetEspacoH(altura: 10),
              Column(
                children: [
                  TextContrastFont(
                    text: "", //Gestão
                    semantics: "Gestão Instituto Dragão do Mar",
                    style: FontsApp.roboto16W400Black(FontsApp.tamanhoBase),
                  ),
                  const widgetEspacoH(altura: 5),
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: !ColorsApp.contraste ? "dragaodomarnova.png" : "dragaodomarcontraste.png",
                    ),
                    width: 213, //201
                    height: 46, //201
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
