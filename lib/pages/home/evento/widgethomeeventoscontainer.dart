// ignore_for_file: camel_case_types

import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/evento/pageeventodetalhe.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class widgetHomeCategoriasEventosContainer extends StatelessWidget {
  const widgetHomeCategoriasEventosContainer({
    super.key,
    required this.evento,
  });

  final Evento evento;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageEventoDetalhe(
              evento: evento,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Card(
          child: Container(
            height: 240,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEDEDED).withOpacity(.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(0),
                      top: Radius.circular(10),
                    ),
                    /* image: DecorationImage(
                      image: widgetImagemExterna(
                        imagem: Imagem(
                          base64: evento
                              .eventosimagens!.first.imagens!.first.base64,
                          url: evento.eventosimagens!.first.imagens!.first.url,
                          tipoimagem: evento.eventosimagens!.first.imagens!
                                      .first.tipo ==
                                  'U'
                              ? TipoImagem.url
                              : TipoImagem.base64,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ) */
                  ),
                  child: widgetImagemHtml(
                    url: evento.eventosimagens!.first.imagens!.first.url!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder: (p0, p1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const widgetEspacoH(altura: 6),
                          Text(
                            evento.nome!,
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const widgetEspacoH(altura: 6),
                          Text(
                            evento.endereco(),
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                            ),
                            maxLines: 2,
                          ),
                          const widgetEspacoH(altura: 6),
                          mostraDatas(
                            evento.eventosdatas!
                                .map((e) => e.datahora!)
                                .toList(),
                          ),
                          //
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mostraDatas(List<String> datas) {
    Widget ret = const Text("");
    String diaabr = datas.first.formatDate(format: "E").capitalize();
    String dia = datas.first.formatDate(format: "dd").capitalize();
    String mes = datas.first.formatDate(format: "MMM").capitalize();
    String hora = datas.first.formatDate(format: "HH:mm").capitalize();
    if (datas.length == 1) {
      ret = Text(
        "$diaabr. $dia/$mes - $hora hs.",
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      ret = Text(
        "Veja em detalhes os horários",
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    }
    return ret;
  }
}
