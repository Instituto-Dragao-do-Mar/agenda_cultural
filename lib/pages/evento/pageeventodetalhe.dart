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

  Espaco? espaco;

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
      appBar: AppBar(
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
                    Text(
                      app.GetCategoriasEvento(widget.evento),
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
      children: [
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
          widget.evento.detalhe!,
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
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const widgetEspacoH(),
        Text(
          app.GetEnderecoEvento(widget.evento),
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black,
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
    return Column(
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
              imagem: Imagem(url: 'bottomcalendario.png'),
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
            widgetImagemInterna(
              imagem: Imagem(url: 'hora.png'),
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
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const widgetEspacoH(),
        Text(
          texto,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black,
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
        Text(
          "Mais informações",
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
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
                Text(
                  'Classificação ${widget.evento.classificacaoetaria ?? "Livre"}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
                Text(
                  entrada,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Avaliar Evento",
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
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
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: 'gostei_off.png',
                    ),
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Gostei',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: 'nao_gostei_off.png',
                    ),
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Não Gostei',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
                  widgetImagemInterna(
                    imagem: Imagem(
                      url: 'nao_aconteceu_off.png',
                    ),
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Não Aconteceu',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
        descricao: 'Para avaliar um evento você precisa '
            'se logar, gostaria de ir para a página de login?',
        funcaoSim: () {},
      );
    }
  }
}
