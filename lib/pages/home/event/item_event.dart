import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/widgetBotaoFavorito.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/pages/evento/event_detail_page.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class ItemEventWidget extends StatefulWidget {
  final Evento evento;
  final String? origem;

  const ItemEventWidget({
    super.key,
    required this.evento,
    this.origem,
  });

  @override
  State<ItemEventWidget> createState() => _ItemEventWidgetState();
}

class _ItemEventWidgetState extends State<ItemEventWidget> {
  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();
  List<Favorito> favoritos = <Favorito>[];
  int favorito = 0;

  AppModel? app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    favoritos = app?.listaFavoritos.favoritos ?? <Favorito>[];
    favoritos.map((e) => e.idevento).contains(widget.evento.id) ? favorito = 1 : favorito = 0;
  }

  @override
  Widget build(BuildContext context) {
    app!.getFavoritos();

    String nomeEspacoPrincipal = app!.GetEspacoPrincipal(
      evento: widget.evento,
    );

    if (widget.evento.id == null) {
      return const SizedBox.shrink();
    }

    try {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(
              evento: widget.evento,
              origem: widget.origem,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(8),
          height: 270 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: !Cores.contraste ? const Color(0xFFF6F6F6) : Colors.black.withOpacity(.8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
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
                              text: widget.evento.nome ?? 'Evento',
                              maxlines: 1,
                              style: GoogleFonts.roboto(
                                fontSize: Fontes.tamanhoBase - 4,
                                fontWeight: FontWeight.w500,
                                color: corTextAtual,
                              ),
                            ),
                            SizedBox(height: nomeEspacoPrincipal.isNotEmpty ? 9 : 6),
                            Flex(
                              direction: Axis.vertical,
                              children: [
                                TextContrasteFonte(
                                  text: app?.GetEspacoEvento(widget.evento),
                                  style: GoogleFonts.roboto(
                                    fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
                                    color: corTextAtual,
                                  ),
                                  maxlines: 2,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            _buildDatesEvent(
                              widget.evento.eventosdatas!.map((e) => e.datahora!).toList(),
                            ),
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
                        evento: widget.evento,
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
    } catch (s) {
      return Text(widget.evento.nome ?? 'sem nome');
    }
  }

  Container _buildImageEvent() {
    var imagemEvento = widget.evento.eventosimagens!.first.imagens!.first.url!;

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

  Widget _buildDatesEvent(List<String> datas) {
    Widget ret = const Text("");
    String diaabr = datas.first.formatDate(format: "E").capitalize();
    String dia = datas.first.formatDate(format: "dd").capitalize();
    String mes = datas.first.formatDate(format: "MMM").capitalize();
    String hora = datas.first.formatDate(format: "HH:mm").capitalize();
    ret = Row(
      children: [
        TextContrasteFonte(
          text: "$diaabr. $dia/$mes - $hora",
          style: GoogleFonts.roboto(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
      ],
    );
    return ret;
  }
}
