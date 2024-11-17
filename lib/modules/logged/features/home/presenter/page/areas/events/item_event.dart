import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/widgetBotaoFavorito.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class ItemEventWidget extends StatelessWidget {
  final Evento evento;
  final Espaco spacePrincipal;
  final void Function() onTapEvent;

  const ItemEventWidget({
    super.key,
    required this.evento,
    required this.spacePrincipal,
    required this.onTapEvent,
  });

  @override
  Widget build(BuildContext context) {
    List<String> datas = evento.eventosdatas!.map((e) => e.datahora!).toList();
    String diaabr = datas.first.formatDate(format: 'E').capitalize();
    String dia = datas.first.formatDate(format: 'dd').capitalize();
    String mes = datas.first.formatDate(format: 'MMM').capitalize();
    String hora = datas.first.formatDate(format: 'HH:mm').capitalize();

    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 270 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !Cores.contraste ? const Color(0xFFF6F6F6) : Colors.black.withOpacity(.8),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 2, offset: const Offset(2, 2))],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageEvent(),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                  child: LayoutBuilder(
                    builder: (p0, p1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          TextContrasteFonte(
                            text: evento.nome ?? 'Evento',
                            maxlines: 2,
                            style: GoogleFonts.roboto(
                              fontSize: Fontes.tamanhoBase - 4,
                              fontWeight: FontWeight.w500,
                              color: corTextAtual,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Flex(
                            direction: Axis.vertical,
                            children: [
                              TextContrasteFonte(
                                text: spacePrincipal.nome ?? 'Espaço',
                                style: GoogleFonts.roboto(
                                  fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
                                  color: corTextAtual,
                                ),
                                maxlines: 2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              TextContrasteFonte(
                                text: '$diaabr $dia/$mes - $hora',
                                style: GoogleFonts.roboto(
                                  fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
                                  fontWeight: FontWeight.w500,
                                  color: corTextAtual,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonFavoriteWidget(
                      evento: evento,
                      isCardEvent: true,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildImageEvent() {
    var imagemEvento = evento.eventosimagens!.first.imagens!.first.url!;

    return Container(
      height: 150 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
      width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0), top: Radius.circular(10)),
      ),
      child: imagemEvento.contains('https')
          ? widgetImagemExterna(
              imagem: Imagem(
                tipoimagem: TipoImagem.url,
                url: imagemEvento,
              ),
              fit: BoxFit.cover,
            )
          : imagemEvento.contains('http')
              ? Image.network(
                  imagemEvento,
                )
              : widgetImagemInterna(
                  imagem: Imagem(
                    tipoimagem: TipoImagem.url,
                    url: imagemEvento.replaceFirst('.png', 'padrao.png'),
                  ),
                  fit: BoxFit.cover,
                ),
    );
  }
}
