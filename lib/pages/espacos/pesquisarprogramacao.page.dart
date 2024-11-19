import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';

class PesquisarProgramacaoPage extends StatefulWidget {
  const PesquisarProgramacaoPage({
    super.key,
    required this.eventos,
  });

  final List<Event> eventos;

  @override
  State<PesquisarProgramacaoPage> createState() => _PesquisarProgramacaoPageState();
}

class _PesquisarProgramacaoPageState extends State<PesquisarProgramacaoPage> {
  late AppModel app;
  TextEditingController tedBusca = TextEditingController();
  String filtro = '';

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widgetTopoComum(
            text: AppLocalizations.of(context)!.e_ticket_search,
            funcaoImagem1: () async {
              Navigator.pop(context);
            },
            labelImagem1: "Voltar para página anterior",
            urlImagem1: 'seta.png',
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.schedule_filter_subtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: tedBusca,
                  onChanged: (value) {
                    filtro = tedBusca.text;
                    setState(() {});
                  },
                ),
              ),
              const widgetEspacoH(),
              IconButton(
                onPressed: () {
                  filtro = tedBusca.text;
                  setState(() {});
                },
                icon: const Icon(Icons.search),
              ),
              const widgetEspacoH(),
            ],
          ),
          const widgetEspacoV(),
          // Expanded(
          //   child: Wrap(
          //     children: widget.eventos
          //         .where((element) => element.nome!.toUpperCase().contains(filtro.toUpperCase()))
          //         .map((e) {
          //       return ItemEventWidget(
          //         event: e,
          //         spacePrincipal: Espaco(),
          //         onTapEvent: () {},
          //       );
          //     }).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
