// ignore_for_file: camel_case_types

import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/evento/pageeventodetalhe.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(0),
                      top: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: widgetImagem(
                        imagem: evento.listaImagem!.imagens!.first,
                      ).image,
                      fit: BoxFit.cover,
                    ),
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
                            evento.endereco!.getEnderecoShort(),
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                            ),
                            maxLines: 2,
                          ),
                          const widgetEspacoH(altura: 6),
                          mostraDatas(evento.datas!),
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
