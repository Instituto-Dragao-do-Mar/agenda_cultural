// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetConfirma.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class pageEspacoDetalhe extends StatefulWidget {
  const pageEspacoDetalhe({
    super.key,
    required this.espaco,
  });

  final Espaco espaco;

  @override
  State<pageEspacoDetalhe> createState() => _pageEspacoDetalheState();
}

class _pageEspacoDetalheState extends State<pageEspacoDetalhe> {
  late AppModel app;
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition inicioCamera;
  Set<Marker> markers = {};

  Espaco? espaco;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);

    espaco = widget.espaco;

    
    if (espaco != null) {
      inicioCamera = CameraPosition(
        target: LatLng(espaco!.latitude!, espaco!.longitude!),
        zoom: 16,
      );

      Marker marker = Marker(
        markerId: MarkerId(widget.espaco.id.toString()),
        position: LatLng(espaco!.latitude!, espaco!.longitude!),
        // icon: BitmapDescriptor.,
        infoWindow: InfoWindow(
          title: widget.espaco.nome!,
          snippet: widget.espaco.detalhe ?? "",
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
          text: "Espaço",
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
              url: widget.espaco.espacosimagens!.first.imagens!.first.url!,
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
                    /* TextContrasteFonte(
                      text: app.GetCategoriasEvento(widget.espaco),
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                        color: corBackgroundLaranja,
                      ),
                    ), */
                    const widgetEspacoH(),
                    TextContrasteFonte(
                      text: widget.espaco.nome ?? "--",
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase.toDouble(),
                        fontWeight: FontWeight.w600,
                        color: corTextAtual,
                      ),
                    ),
                    const widgetEspacoH(),
                    widgetDatasEspacos(),
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
                    widgetEvAvaliarEspaco(),
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
      mainAxisAlignment: MainAxisAlignment.start,
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
          widget.espaco.detalhe!,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
          colorClickableText: corBackgroundLaranja,
          trimLength: 300,
          trimMode: TrimMode.Length,
          trimCollapsedText: ' Ler mais',
          trimExpandedText: ' Ler menos',
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
          app.GetEnderecoEspaco(widget.espaco),
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

  Widget widgetDatasEspacos() {
    return const SizedBox.shrink();

    /* return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.espaco.eventosdatas!.map((e) {
        String diaabr = e.datahora!.formatDate(format: "E").capitalize();
        String dia = e.datahora!.formatDate(format: "dd");
        String mes = e.datahora!.formatDate(format: "MM").capitalize();
        String hora = e.datahora!.formatDate(format: "HH:mm").capitalize();
        String ano = e.datahora!.formatDate(format: "yyyy");

        return Row(
          children: [
            widgetImagemInterna(
              imagem: Imagem(url: 'bottomcalendario.png'),
            ),
            const widgetEspacoV(largura: 4),
            TextContrasteFonte(
              text: "$diaabr, $dia/$mes/$ano",
              style: GoogleFonts.inter(
                fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
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
                fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                fontWeight: FontWeight.w500,
                color: corTextAtual,
              ),
            ),
          ],
        );
      }).toList(),
    );
  */
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
    return const SizedBox.shrink();

    /*
    String entrada = 'Entraga Gratuita';
    if (widget.espaco.urlentrada != null &&
        widget.espaco.urlentrada!.isNotEmpty) {
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
                      'Classificação ${widget.espaco.classificacaoetaria ?? "Livre"}',
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
    );*/
  }

  Widget widgetEvAvaliarEspaco() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: "Avaliar Espaço",
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
            GestureDetector(
              onTap: () {
                confirmaparaAvaliar();
              },
              child: Column(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: corBackgroundLaranja,
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
                      fontSize:
                          Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                confirmaparaAvaliar();
              },
              child: Column(
                children: [
                  Icon(
                    Icons.sentiment_dissatisfied_outlined,
                    color: corBackgroundLaranja,
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
                      fontSize:
                          Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                confirmaparaAvaliar();
              },
              child: Column(
                children: [
                  Icon(
                    Icons.sentiment_neutral_outlined,
                    color: corBackgroundLaranja,
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
                      fontSize:
                          Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void confirmaparaAvaliar() {
    if (!app.isLog()) {
      widgetConfirma(
        context: context,
        cancelar: true,
        descricao: 'Para avaliar um espaço você precisa '
            'se logar, gostaria de ir para a página de login?',
        funcaoSim: () {},
      );
    }
  }
}
