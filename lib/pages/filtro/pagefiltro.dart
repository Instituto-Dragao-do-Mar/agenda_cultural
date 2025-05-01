// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class pageFiltro extends StatefulWidget {
  const pageFiltro({super.key});

  @override
  State<pageFiltro> createState() => _pageFiltroState();
}

class _pageFiltroState extends State<pageFiltro> {
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
      /* appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: widgetImagemInterna(
            imagem: Imagem(url: 'seta.png'),
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Filtrar",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ), */
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
            text: "Filtrar",
            funcaoImagem1: () async {
              Navigator.pop(context);
            },
            labelImagem1: "Voltar para página anterior",
            urlImagem1: 'seta.png',
            funcaoImagem2: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const pageFiltro(),
                ),
              );
            },
            urlImagem2: 'favoritos.png',
            labelImagem2: "Filtrar",
          ),
          const SizedBox(height: 8,),
          Text(
            "Termo a Pesquisar",
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
                  onFieldSubmitted: (value) {
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
          Expanded(
            child: Wrap(
              children: app.listaEventos.eventos!
                  .where((element) => element.nome!
                      .toUpperCase()
                      .contains(filtro.toUpperCase()))
                  .map((e) {
                return widgetHomeCategoriasEventosContainer(
                  evento: e,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
