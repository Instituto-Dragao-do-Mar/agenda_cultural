// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetConfirma.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../model/fontes.dart';
import '../../shared/widgetBotaoFavorito.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../agenda/pageagenda.dart';
import '../favorito/widgetFavoritos.dart';
import '../home/widgethome.dart';
import '../home/widgetperfil.dart';
import '../mapa/pagemapa.dart';

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
  late AppModel app;
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition inicioCamera;
  Set<Marker> markers = {};
  var selecionado = 0;
  int opcaoSelecionadaNavBar = 0;

  Espaco? espaco;
  List<Widget> subPaginas = [
    const widgetHome(),
    const pageAgenda(),
    const pageMapa(),
    const WidgetFavoritos(),
    widgetPerfil(),
  ];

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);

    int idEspaco = widget.evento.eventosdatas!.first.idespaco!;
    if (app.listaEspacos.espacos!.any((element) => element.id == idEspaco)) {
      espaco = app.listaEspacos.espacos!
          .firstWhere((element) => element.id == idEspaco);
    }

    if (espaco != null) {
      inicioCamera = CameraPosition(
        target: LatLng(espaco!.latitude!, espaco!.longitude!),
        zoom: 16,
      );

      Marker marker = Marker(
        markerId: MarkerId(widget.evento.id.toString()),
        position: LatLng(espaco!.latitude!, espaco!.longitude!),
        // icon: BitmapDescriptor.,
        infoWindow: InfoWindow(
          title: widget.evento.nome!,
          snippet: widget.evento.detalhe ?? "",
        ),
      );
      markers.add(marker);
    } else {
      inicioCamera = const CameraPosition(
        target: LatLng(-3.7608777226578134, -38.521393491712224),
        zoom: 16,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      // bottomNavigationBar: bottomNavi(),
      appBar: AppBar(
        backgroundColor: corBgAtual,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: widgetImagemInterna(
            imagem: Imagem(url: 'seta.png'),
          ),
        ),
        centerTitle: false,
        title: TextContrasteFonte(
          text: "Evento",
          style: TextStyle(
            color: corTextAtual,
            fontSize: Fontes.tamanhoBase.toDouble(),
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .7,
            child: widgetImagemHtml(
              url: widget.evento.eventosimagens!.first.imagens!.first.url!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (p0, p1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContrasteFonte(
                      text: app.GetCategoriasEvento(widget.evento),
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase -
                            (Fontes.tamanhoFonteBase16 - 14),
                        color: corBackgroundLaranja,
                      ),
                    ),
                    const widgetEspacoH(),
                    TextContrasteFonte(
                      text: widget.evento.nome!,
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase.toDouble(),
                        fontWeight: FontWeight.w600,
                        color: corTextAtual,
                      ),
                    ),
                    const widgetEspacoH(),
                    widgetDatasEventos(),
                    const widgetEspacoH(altura: 20),
                    widgetEvDescicao(),
                    const widgetEspacoH(),
                    widgetEVLocalizacao(),
                    const widgetEspacoH(),
                    widgetEVMapa(),
                    const widgetEspacoH(),
                    widgetEvAcessibilidade(),
                    const widgetEspacoH(),
                    widgetEvMaisInformacoes(),
                    const widgetEspacoH(),
                    widgetEvAvaliarEvento(),
                    const widgetEspacoH(),
                    const widgetEspacoH(),
                    const widgetEspacoH(),
                    const widgetEspacoH(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column widgetEvDescicao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: "Descrição",
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const widgetEspacoH(),
        ReadMoreText(
          widget.evento.detalhe!,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
          colorClickableText: corBackgroundLaranja,
          trimLength: 300,
          trimMode: TrimMode.Length,
          trimCollapsedText: 'Ler mais',
          trimExpandedText: 'Ler menos',
          moreStyle: TextStyle(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.bold,
            color: corBackgroundLaranja,
          ),
          lessStyle: TextStyle(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.bold,
            color: corBackgroundLaranja,
          ),
        ),
      ],
    );
  }

  Column widgetEVLocalizacao() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Localização",
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const widgetEspacoH(),
        Text(
          app.GetEnderecoEvento(widget.evento),
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
      ],
    );
  }

  LayoutBuilder widgetEVMapa() {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: p1.maxWidth,
              height: p1.maxWidth * .5,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: markers,
                initialCameraPosition: inicioCamera,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraIdle: () {},
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget widgetDatasEventos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.evento.eventosdatas!.map((e) {
            String diaabr = e.datahora!.formatDate(format: "E").capitalize();
            String dia = e.datahora!.formatDate(format: "dd");
            String mes = e.datahora!.formatDate(format: "MM").capitalize();
            String hora = e.datahora!.formatDate(format: "HH:mm").capitalize();
            String ano = e.datahora!.formatDate(format: "yyyy");

            return Row(
              children: [
                widgetImagemInterna(
                  imagem: Imagem(url: 'fagenda.png'),
                ),
                const widgetEspacoV(largura: 4),
                TextContrasteFonte(
                  text: "$diaabr, $dia/$mes/$ano",
                  style: GoogleFonts.inter(
                    fontSize:
                        Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
                  ),
                ),
                const widgetEspacoV(largura: 20),
                widgetImagemInterna(
                  imagem: Imagem(url: 'hora.png'),
                ),
                const widgetEspacoV(largura: 4),
                TextContrasteFonte(
                  text: hora,
                  style: GoogleFonts.inter(
                    fontSize:
                        Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        WidgetBotaoFavorito(evento: widget.evento),
      ],
    );
  }

  Widget widgetEvAcessibilidade() {
    String texto = espaco!.acessibilidadeFisica ?? "";
    if (texto.isEmpty) {
      texto = 'Informações indisponíveis no momento.';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Acessibilidade",
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const widgetEspacoH(),
        Text(
          texto,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
      ],
    );
  }

  Widget widgetEvMaisInformacoes() {
    String entrada = 'Entraga Gratuita';
    if (widget.evento.urlentrada != null &&
        widget.evento.urlentrada!.isNotEmpty) {
      entrada = 'Entraga Paga';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: "Mais informações",
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const widgetEspacoH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widgetImagemInterna(
                  imagem: Imagem(
                    url: 'classificacao.png',
                  ),
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10),
                TextContrasteFonte(
                  text:
                      'Classificação ${widget.evento.classificacaoetaria ?? "Livre"}',
                  style: GoogleFonts.inter(
                    fontSize:
                        Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                widgetImagemInterna(
                  imagem: Imagem(
                    url: 'ticket.png',
                  ),
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10),
                TextContrasteFonte(
                  text: entrada,
                  style: GoogleFonts.inter(
                    fontSize:
                        Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget widgetEvAvaliarEvento() {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: "Avaliar Evento",
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const widgetEspacoH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 0.3,
              child: GestureDetector(
                onTap: () {
                  confirmaparaAvaliar(1);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: selecionado == 1
                          ? corBackgroundLaranja
                          : corTextAtual,
                      size: 50 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
                    ),
                    // widgetImagemInterna(
                    //   imagem: Imagem(
                    //     url: 'gostei_off.png',
                    //   ),
                    //   width: 60,
                    //   height: 60,
                    //   fit: BoxFit.contain,
                    // ),
                    TextContrasteFonte(
                      text: 'Gostei',
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase -
                            (Fontes.tamanhoFonteBase16 - 14),
                        fontWeight: FontWeight.w500,
                        color: corTextAtual,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 0.3,
              child: GestureDetector(
                onTap: () {
                  confirmaparaAvaliar(2);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.sentiment_dissatisfied_outlined,
                      color: selecionado == 2
                          ? corBackgroundLaranja
                          : corTextAtual,
                      size: 50 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
                    ),
                    // widgetImagemInterna(
                    //   imagem: Imagem(
                    //     url: 'nao_gostei_off.png',
                    //   ),
                    //   width: 60,
                    //   height: 60,
                    //   fit: BoxFit.contain,
                    // ),
                    TextContrasteFonte(
                      text: 'Não Gostei',
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase -
                            (Fontes.tamanhoFonteBase16 - 14),
                        fontWeight: FontWeight.w500,
                        color: corTextAtual,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 0.3,
              child: GestureDetector(
                onTap: () {
                  confirmaparaAvaliar(3);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.sentiment_neutral_outlined,
                      color: selecionado == 3
                          ? corBackgroundLaranja
                          : corTextAtual,
                      size: 50 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
                    ),
                    // Container(
                    //   width: 60,
                    //   height: 60,
                    //   color: corBg,
                    //   child: widgetImagemInterna(
                    //     imagem: Imagem(
                    //       url: 'nao_aconteceu_off.png',
                    //     ),
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    TextContrasteFonte(
                      text: 'Não Aconteceu',
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase -
                            (Fontes.tamanhoFonteBase16 - 14),
                        fontWeight: FontWeight.w500,
                        color: corTextAtual,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void confirmaparaAvaliar(int value) {
    if (!app.isLog()) {
      return widgetConfirma(
        context: context,
        cancelar: true,
        descricao: 'Para avaliar um evento você precisa '
            'se logar, gostaria de ir para a página de login?',
        funcaoSim: () {},
      );
    }
    setState(() {
      value != 0 && selecionado != value
          ? selecionado = value
          : selecionado = 0;
    });
  }

  BottomNavigationBar bottomNavi() {
    return BottomNavigationBar(
      onTap: (i) {
        setState(
          () {
            opcaoSelecionadaNavBar = i;
          },
        );
      },
      backgroundColor: corBgAtual,
      elevation: 0,
      showUnselectedLabels: true,
      unselectedFontSize: 12,
      selectedFontSize: 12,
      unselectedItemColor: corTextAtual,
      selectedItemColor: corBackgroundLaranja,
      currentIndex: opcaoSelecionadaNavBar,
      items: [
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fhome.png',
          )),
          label: "Home",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fagenda.png',
          )),
          label: "Agenda",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fmapa.png',
          )),
          label: "Mapa",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'ffavorito.png',
          )),
          label: "Favoritos",
        ),
        BottomNavigationBarItem(
          backgroundColor: corBgAtual,
          icon: widgetImagemInterna(
              imagem: Imagem(
            url: 'fperfil.png',
          )),
          label: "Perfil",
        ),
      ],
    );
  }
}
