import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/pages/espacos/pesquisarprogramacao.page.dart';

class ProgramacaoEspacoPage extends StatefulWidget {
  const ProgramacaoEspacoPage({
    super.key,
    required this.espaco,
  });

  final Space espaco;

  @override
  State<ProgramacaoEspacoPage> createState() => _ProgramacaoEspacoPageState();
}

class _ProgramacaoEspacoPageState extends State<ProgramacaoEspacoPage> {
  late AppModel? app;
  List<Event> eventos = [];

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    // for (Event e in app!.listaEventos.eventos ?? eventos) {
    //   String nomeEspacoPrincipal = app!.GetEspacoPrincipal(evento: e);
    //   String nomeEspacoPrincipal2 = app!.GetEspacoEvento(e);
    //   if (nomeEspacoPrincipal != '') {
    //     if (nomeEspacoPrincipal == widget.espaco.nome) eventos.add(e);
    //   } else {
    //     if (nomeEspacoPrincipal2 == widget.espaco.nome) eventos.add(e);
    //   }
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getdados() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        leading: Semantics(
          container: false,
          label: "Voltar para tela anterior",
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: widgetImagemInterna(
              imagem: Imagem(url: 'seta.png'),
            ),
          ),
        ),
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextContrasteFonte(
              text: AppLocalizations.of(context)!.e_title_e,
              style: TextStyle(
                color: corTextAtual,
                fontSize: Fontes.tamanhoBase.toDouble(),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PesquisarProgramacaoPage(
                        eventos: eventos,
                      );
                    },
                  ),
                );
              },
              child: widgetImagemInterna(
                imagem: Imagem(url: 'favoritos.png'),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: body(),
      bottomNavigationBar: const WidgetBottomNavigator(replacePage: 2),
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.espaco.nome ?? 'Nome do Espaço',
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        AppLocalizations.of(context)!.home_filter,
                        style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {},
                      child: widgetImagemInterna(
                        imagem: Imagem(
                          url: 'filtro.png',
                        ),
                        width: 16,
                        height: 16,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              AppLocalizations.of(context)!.e_programming,
              style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
            ),
            const SizedBox(height: 10),
            // eventos.isEmpty
            //     ? Text(
            //         AppLocalizations.of(context)!.e_programming_default,
            //       )
            //     : Wrap(
            //         children: eventos.map(
            //           (e) {
            //             return ItemEventWidget(
            //               event: e,
            //               spacePrincipal: Espaco(),
            //               onTapEvent: () {},
            //             );
            //           },
            //         ).toList(),
            //       ),
          ],
        ),
      ),
    );
  }
}
