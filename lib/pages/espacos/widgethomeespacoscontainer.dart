// ignore_for_file: camel_case_types, must_be_immutable

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/cores.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class widgetHomeEspacosContainer extends StatelessWidget {
  widgetHomeEspacosContainer({
    super.key,
    required this.espaco,
  });

  final Espaco espaco;

  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageEventoDetalhe(
              evento: evento,
            ),
          ),
        );*/
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Card(
          child: Container(
            height: 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
            width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (!Cores.contraste
                  ? Color(0xFFEDEDED).withOpacity(.2)
                  : corBgAltoContraste.withOpacity(.8)),
              border: Border.all(width: 1, color: corBg),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
                  width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
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
                    url: espaco.espacosimagens!.first.imagens!.first.url!,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8),
                  child: LayoutBuilder(
                    builder: (p0, p1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const widgetEspacoH(altura: 6),
                          TextContrasteFonte(
                            text: espaco.nome!,
                            maxlines: 1,
                            style: GoogleFonts.roboto(
                              fontSize: Fontes.tamanhoBase -
                                  (Fontes.tamanhoFonteBase16 - 12),
                              fontWeight: FontWeight.w500,
                              color: corTextAtual,
                            ),
                          ),
                          const widgetEspacoH(altura: 6),
                          Flex(direction: Axis.vertical, children: [
                            TextContrasteFonte(
                              text: app.GetEnderecoEspaco(espaco),
                              style: GoogleFonts.roboto(
                                fontSize: Fontes.tamanhoBase -
                                    (Fontes.tamanhoFonteBase16 - 12),
                                color: corTextAtual,
                              ),
                              maxlines: 2,
                            ),
                          ]),
                          const widgetEspacoH(altura: 6),
                          /* TextContrasteFonte(
                            text: espaco.horario ?? "Não informado.",
                            style: GoogleFonts.roboto(
                              fontSize: Fontes.tamanhoBase -
                                  (Fontes.tamanhoFonteBase16 - 12),
                              fontWeight: FontWeight.w500,
                              color: corTextAtual,
                            ),
                          ), */
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

  /* Widget mostraDatas(List<String> datas) {
    Widget ret = const Text("");
    String diaabr = datas.first.formatDate(format: "E").capitalize();
    String dia = datas.first.formatDate(format: "dd").capitalize();
    String mes = datas.first.formatDate(format: "MMM").capitalize();
    String hora = datas.first.formatDate(format: "HH:mm").capitalize();
    if (datas.length == 1) {
      ret = TextContrasteFonte(
        text: "$diaabr. $dia/$mes - $hora hs.",
        style: GoogleFonts.roboto(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
            fontWeight: FontWeight.w500,
            color: corTextAtual),
      );
    } else {
      ret = TextContrasteFonte(
        text: "Veja em detalhes os horários",
        style: GoogleFonts.roboto(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
            fontWeight: FontWeight.w500,
            color: corTextAtual),
      );
    }
    return ret;
  }*/
}
