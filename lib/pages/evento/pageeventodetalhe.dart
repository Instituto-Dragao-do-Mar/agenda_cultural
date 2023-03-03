// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:agendacultural/controller/usuarioavaliacao_controller.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/usuarioavaliacao_model.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetConfirma.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:agendacultural/shared/widgetpopup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../../model/fontes.dart';
import '../../shared/widgetBotaoFavorito.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../acesso/pagelogin.dart';
import '../agenda/pageagenda.dart';
import '../favorito/widgetFavoritos.dart';
import '../home/widgethome.dart';

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
                    if (widget.evento.eventosdatas!.first.datahora!
                            .formatDate(format: 'yyyy-MM-dd') ==
                        DateTime.now()
                            .toIso8601String()
                            .formatDate(format: 'yyyy-MM-dd'))
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
    String nomeEspacoPrincipal = app.GetEspacoPrincipal(
      evento: widget.evento,
    );
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
        if (nomeEspacoPrincipal.isNotEmpty)
          TextContrasteFonte(
            text: nomeEspacoPrincipal,
            maxlines: 1,
            style: GoogleFonts.roboto(
              fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
              color: corTextAtual,
              fontWeight: FontWeight.w500,
            ),
          ),
        //
        if (nomeEspacoPrincipal.isNotEmpty) const widgetEspacoH(altura: 3),
        Text(
          app.GetEspacoEvento(widget.evento),
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
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
    if (widget.evento.eventosdatas!.length > 3) {
      return Row(
        children: [
          widgetImagemInterna(
            imagem: Imagem(url: 'fagenda.png'),
          ),
          const widgetEspacoV(largura: 4),
          Expanded(
            child: TextContrasteFonte(
              text: widget.evento.eventosdatas!.first.detalhe ?? '',
              maxlines: 3,
              style: GoogleFonts.inter(
                fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                fontWeight: FontWeight.w500,
                color: corTextAtual,
              ),
            ),
          ),
        ],
      );
    }

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
    String entrada = 'Entrada Gratuita';
    if (widget.evento.urlentrada != null &&
        widget.evento.urlentrada!.isNotEmpty) {
      entrada = 'Entrada Paga';
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

  Future<ListaUsuarioAvaliacao> getdadosAvaliacao() async {
    ListaUsuarioAvaliacao lista = ListaUsuarioAvaliacao();

    if (app.isLog()) {
      UsuarioAvaliacaoController controller = UsuarioAvaliacaoController();

      lista = await controller.UsuarioAvaliacaoGet(
        userguidid: app.GetGuidId(),
        eventoguidid: widget.evento.guidid!,
        token: app.GetToken(),
      );
    }
    return lista;
  }

  Widget widgetEvAvaliarEvento() {
    var size = MediaQuery.of(context).size;

    //print(widget.evento.eventosdatas!.first.datahora);

    return FutureBuilder(
      future: getdadosAvaliacao(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        ListaUsuarioAvaliacao lista = snapshot.data as ListaUsuarioAvaliacao;

        if (lista.usuariosavaliacoes != null &&
            lista.usuariosavaliacoes!.isNotEmpty) {
          selecionado = lista.usuariosavaliacoes!.first.avaliacao ?? 0;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const widgetEspacoH(),
            const widgetEspacoH(),
            TextContrasteFonte(
              text: "Avaliar Evento",
              style: GoogleFonts.inter(
                fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                fontWeight: FontWeight.w500,
                color: corTextAtual,
              ),
            ),
            const widgetEspacoH(),
            const widgetEspacoH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  child: GestureDetector(
                    onTap: () async {
                      TextEditingController tedComentario =
                          TextEditingController();

                      await showFuturePopupDialog(
                        context: context,
                        edits: [
                          EditPopup(
                            edit: tedComentario,
                            funcao: (v) {},
                            tipo: EditPopupType.texto,
                            titulo: "Comentário",
                          ),
                        ],
                        funcaoBtnOk: () async {
                          return true;
                        },

                        titulo: "Comentário (opcional)",
                      );

                      confirmaparaAvaliar(1, tedComentario.text);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                          color: selecionado == 1
                              ? corBackgroundLaranja
                              : corTextAtual,
                          size: 50 /
                              Fontes.tamanhoFonteBase16 *
                              Fontes.tamanhoBase,
                        ),
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
                SizedBox(
                  width: size.width * 0.3,
                  child: GestureDetector(
                    onTap: () async {
                      TextEditingController tedComentario =
                          TextEditingController();

                      await showFuturePopupDialog(
                        context: context,
                        edits: [
                          EditPopup(
                            edit: tedComentario,
                            funcao: (v) {},
                            tipo: EditPopupType.texto,
                            titulo: "Comentário",
                          ),
                        ],
                        funcaoBtnOk: () async {
                          return true;
                        },
                        titulo: "Comentário (opcional)",
                      );

                      confirmaparaAvaliar(2, tedComentario.text);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          color: selecionado == 2
                              ? corBackgroundLaranja
                              : corTextAtual,
                          size: 50 /
                              Fontes.tamanhoFonteBase16 *
                              Fontes.tamanhoBase,
                        ),
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
                SizedBox(
                  width: size.width * 0.3,
                  child: GestureDetector(
                    onTap: () async {
                      TextEditingController tedComentario =
                          TextEditingController();
                      await showFuturePopupDialog(
                        context: context,
                        edits: [
                          EditPopup(
                            edit: tedComentario,
                            funcao: (v) {},
                            tipo: EditPopupType.texto,
                            titulo: "Comentário",
                          ),
                        ],
                        funcaoBtnOk: () async {
                          return true;
                        },
                         titulo: "Comentário (opcional)",
                      );

                      confirmaparaAvaliar(3, tedComentario.text);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.sentiment_neutral_outlined,
                          color: selecionado == 3
                              ? corBackgroundLaranja
                              : corTextAtual,
                          size: 50 /
                              Fontes.tamanhoFonteBase16 *
                              Fontes.tamanhoBase,
                        ),
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
      },
    );
  }

  void confirmaparaAvaliar(int value, String comentario) async {
    if (!app.isLog()) {
      widgetConfirma(
        context: context,
        cancelar: true,
        descricao: 'Para avaliar um evento você precisa '
            'se logar, gostaria de ir para a página de login?',
        funcaoSim: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const pageLogin(),
            ),
          );
        },
      );
    } else {
      UsuarioAvaliacaoController ucontroller = UsuarioAvaliacaoController();
      await ucontroller.UsuarioAvaliacaoPost(
        userguidid: app.GetGuidId(),
        avaliacao: value.toString(),
        eventoguidid: widget.evento.guidid!,
        token: app.GetToken(),
        comentario: comentario,
      );
      setState(() {});
    }
  }
}
