import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class pageEventoDetalhe extends StatefulWidget {
  const pageEventoDetalhe({
    super.key,
    required this.evento,
  });

  final Evento evento;

  @override
  State<pageEventoDetalhe> createState() => _pageEventoDetalheState();
}

class _pageEventoDetalheState extends State<pageEventoDetalhe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: widgetImagem(
            imagem: Imagem(url: './imagens/setavoltando.png'),
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Evento",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          widgetImagem(
            imagem: widget.evento.listaImagem!.imagens!.first,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (p0, p1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.evento.categoria!.titulo!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: corBackground,
                      ),
                    ),
                    const widgetEspacoH(),
                    Text(
                      widget.evento.nome!,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const widgetEspacoH(),
                    widgetDatasEventos(),
                    const widgetEspacoH(altura: 20),
                    Text(
                      "Descrição",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const widgetEspacoH(),
                    ReadMoreText(
                      widget.evento.descricao!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      colorClickableText: corBackground,
                      trimLength: 300,
                      trimMode: TrimMode.Length,
                      trimCollapsedText: 'Ler mais',
                      trimExpandedText: 'Ler menos',
                      moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: corBackground,
                      ),
                      lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: corBackground,
                      ),
                    ),
                    const widgetEspacoH(),
                    Text(
                      "Localização",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const widgetEspacoH(),
                    Text(
                      widget.evento.endereco.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const widgetEspacoH(),
                    widgetImagem(
                        imagem: Imagem(url: './imagens/mapa.jpeg'),
                        width: p1.maxWidth,
                        height: p1.maxWidth * .5,
                        fit: BoxFit.cover),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetDatasEventos() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.evento.datas!.map((e) {
        String diaabr = e.formatDate(format: "E").capitalize();
        String dia = e.formatDate(format: "dd");
        String mes = e.formatDate(format: "MM").capitalize();
        String hora = e.formatDate(format: "HH:mm").capitalize();
        String ano = e.formatDate(format: "MM/yyyy");

        return Row(
          children: [
            widgetImagem(
              imagem: Imagem(url: './imagens/bottomcalendario.png'),
            ),
            const widgetEspacoV(largura: 4),
            Text(
              "$diaabr, $dia/$mes/$ano",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const widgetEspacoV(largura: 20),
            widgetImagem(
              imagem: Imagem(url: './imagens/hora.png'),
            ),
            const widgetEspacoV(largura: 4),
            Text(
              hora,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
