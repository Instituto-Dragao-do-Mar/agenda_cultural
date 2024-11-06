import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetpopup.dart';
import 'package:agendacultural/pages/mapa/pagemapa.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/pages/home/home_page.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/agenda/pageagenda.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/shared/widgetBotaoFavorito.dart';
import 'package:agendacultural/shared/widgetimagemexterna.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/model/usuarioavaliacao_model.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/widgetNotificacaoPopUp.dart';
import 'package:agendacultural/pages/favorito/widgetFavoritos.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/controller/usuarioavaliacao_controller.dart';

class EventDetailPage extends StatefulWidget {
  final Evento evento;
  final String? origem;

  const EventDetailPage({
    super.key,
    required this.evento,
    this.origem,
  });

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  late AppModel app;
  late CameraPosition inicioCamera;
  Espaco? espaco;

  var selecionado = 0;
  int opcaoSelecionadaNavBar = 0;
  Set<Marker> markers = {};
  String siteIngresso = '';
  List<Widget> subPaginas = [
    const HomePage(),
    const pageAgenda(),
    const pageMapa(),
    const WidgetFavoritos(),
    const widgetPerfil(),
  ];

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);

    int idEspaco = widget.evento.eventosdatas!.first.idespaco!;
    if (app.listaEspacos.espacos!.any((element) => element.id == idEspaco)) {
      espaco = app.listaEspacos.espacos!.firstWhere((element) => element.id == idEspaco);
    }

    if (espaco != null) {
      inicioCamera = CameraPosition(
        target: LatLng(espaco!.latitude!, espaco!.longitude!),
        zoom: 16,
      );

      Marker marker = Marker(
        markerId: MarkerId(widget.evento.id.toString()),
        position: LatLng(espaco!.latitude!, espaco!.longitude!),
        infoWindow: InfoWindow(
          title: widget.evento.nome!,
          snippet: widget.evento.detalhe ?? "",
        ),
      );
      markers.add(marker);

      siteIngresso = widget.evento.urlentrada ?? '';
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
    var textDesc = AppLocalizations.of(context)!.profile_general_alert;
    var textDescOk = AppLocalizations.of(context)!.profile_general_alert_accept;
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        leadingWidth: 40,
        leading: Semantics(
          container: false,
          label: "Voltar para tela anterior",
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: SvgPicture.asset(
                'imagens/icon_arrow_back.svg',
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_title,
          style: TextStyle(
            color: corTextAtual,
            fontSize: Fontes.tamanhoBase.toDouble(),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          _buildBody(),
          if (siteIngresso != '')
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: widgetBotao(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                text: AppLocalizations.of(context)!.e_ticket,
                function: () => widgetNotificaoPopUp(
                  context: context,
                  permitirFechar: true,
                  textDescritivo: textDesc,
                  textBotao: textDescOk,
                  funcaoBotao: () async {
                    var url = Uri.parse(siteIngresso);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.platformDefault,
                      );
                      if (!mounted) return;
                      Navigator.of(context).pop();
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: WidgetBottomNavigator(
        replacePage: widget.origem == "programacao" ? 3 : null,
      ),
    );
  }

  Widget _buildBody() {
    var imagemEvento = widget.evento.eventosimagens!.first.imagens!.first.url!;
    var cat = AppLocalizations.of(context)!.e_category;

    var listCat = app.GetCategoriasEvento(widget.evento);
    List<String> categoriasTraduzidas = [];
    List<String> categorias = listCat.split(",").map((cat) => cat.trim()).toList();
    for (String categoria in categorias) {
      String categoriaTraduzida = app.getNomeCategoria(categoria, context);
      categoriasTraduzidas.add(categoriaTraduzida);
    }
    String listaCategoriasTraduzidas = categoriasTraduzidas.join(", ");

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .9,
            child: Semantics(
              label: "Imagem do evento",
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  label: "$cat: $listaCategoriasTraduzidas",
                  child: TextContrasteFonte(
                    text: "$cat: $listaCategoriasTraduzidas",
                    style: GoogleFonts.inter(
                      fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                      color: corBackgroundLaranja,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextContrasteFonte(
                  text: widget.evento.nome!,
                  style: GoogleFonts.inter(
                    fontSize: Fontes.tamanhoBase.toDouble(),
                    fontWeight: FontWeight.w600,
                    color: corTextAtual,
                  ),
                ),
                if (widget.evento.eventosdatas!.length > 1) const SizedBox(height: 7),
                _buildDateEvent(),
                if (widget.evento.eventosdatas!.length > 1) const SizedBox(height: 7),
                _buildDescription(),
                const SizedBox(height: 10),
                _buildLocation(),
                const SizedBox(height: 10),
                _buildMap(),
                const SizedBox(height: 10),
                _buildAcessibility(),
                const SizedBox(height: 10),
                _buildMoreInformation(),
                const SizedBox(height: 10),
                _buildEvaluation() ?? const SizedBox(),
                siteIngresso != '' ? const SizedBox(height: 60) : const SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateEvent() {
    if (widget.evento.eventosdatas!.length > 1) {
      return Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  'imagens/icon_calendar.svg',
                ),
                const SizedBox(width: 5),
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
            ),
          ),
          Semantics(
            container: false,
            label: "Botão favorito",
            child: WidgetBotaoFavorito(
              evento: widget.evento,
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
          children: widget.evento.eventosdatas!.map(
            (e) {
              String dayWeek = e.datahora!.formatDate(format: "E").capitalize();
              String day = e.datahora!.formatDate(format: "dd");
              String month = e.datahora!.formatDate(format: "MM").capitalize();
              String hour = e.datahora!.formatDate(format: "HH:mm").capitalize();
              String year = e.datahora!.formatDate(format: "yyyy");

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'imagens/icon_calendar.svg',
                    height: 18,
                  ),
                  const SizedBox(width: 4),
                  TextContrasteFonte(
                    text: "$dayWeek, $day/$month/$year",
                    style: GoogleFonts.inter(
                      fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SvgPicture.asset(
                    'imagens/icon_clock.svg',
                    height: 18,
                  ),
                  const SizedBox(width: 4),
                  TextContrasteFonte(
                    text: hour,
                    style: GoogleFonts.inter(
                      fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
        Semantics(
          container: false,
          label: "Botão favorito",
          child: WidgetBotaoFavorito(
            evento: widget.evento,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_descr,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        ReadMoreText(
          '${widget.evento.detalhe!} ',
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
          colorClickableText: corBackgroundLaranja,
          trimLength: 300,
          trimMode: TrimMode.Length,
          trimCollapsedText: AppLocalizations.of(context)!.e_descr_more,
          trimExpandedText: AppLocalizations.of(context)!.e_descr_less,
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

  Widget _buildLocation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_location,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
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

  LayoutBuilder _buildMap() {
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
                initialCameraPosition: inicioCamera,
                markers: markers,
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAcessibility() {
    String texto = espaco!.acessibilidadeFisica ?? "";
    List<String> acessibilidadesTraduzidas = [];
    List<String> acessibilidades = texto.split(";").map((acess) => acess.trim()).toList();
    if (texto.isEmpty) {
      texto = AppLocalizations.of(context)!.e_accessibility_default;
    } else {
      for (String acessibilidade in acessibilidades) {
        String acessTrad = app.getNomeAcessib(acessibilidade, context);
        acessibilidadesTraduzidas.add(acessTrad);
      }
      texto = acessibilidadesTraduzidas.join("; ");
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_accessibility,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
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

  Widget _buildMoreInformation() {
    var ent = AppLocalizations.of(context)!.e_more_info_entry;
    var pr = widget.evento.eventosdatas?.first.preco;
    var grat = AppLocalizations.of(context)!.e_more_info_free;
    var pag = AppLocalizations.of(context)!.e_more_info_paid;
    String? infoent = '$ent: ${pr == 'Gratuito' ? grat : pag}';

    var cl = AppLocalizations.of(context)!.e_more_info_classif;
    var id = widget.evento.classificacaoetaria;
    var an = AppLocalizations.of(context)!.e_more_info_years;
    var fr = AppLocalizations.of(context)!.e_more_info_classif_free;
    String? infocl = '$cl: ${id == "Livre" ? fr : id!.replaceAll('anos', an)}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_more_info,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - 2,
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'imagens/icon_user.svg',
                  height: 18,
                ),
                const SizedBox(width: 5),
                TextContrasteFonte(
                  text: infocl,
                  style: GoogleFonts.inter(
                    fontSize: Fontes.tamanhoBase - 2,
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'imagens/icon_ticket.svg',
                  height: 16,
                ),
                const SizedBox(width: 5),
                TextContrasteFonte(
                  text: infoent,
                  style: GoogleFonts.inter(
                    fontSize: Fontes.tamanhoBase - 2,
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

  Future<ListaUsuarioAvaliacao> _getDataEvaluation() async {
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

  Widget? _buildEvaluation() {
    var size = MediaQuery.of(context).size;

    double fontePadrao = Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14);
    var av1 = AppLocalizations.of(context)!.e_evaluation_one;
    var av2 = AppLocalizations.of(context)!.e_evaluation_two;
    var av3 = AppLocalizations.of(context)!.e_evaluation_three;
    if (widget.evento.eventosdatas!.first.datahora!.formatDate(format: 'yyyy-MM-dd') ==
        DateTime.now().toIso8601String().formatDate(format: 'yyyy-MM-dd')) {
      return FutureBuilder(
        future: _getDataEvaluation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          ListaUsuarioAvaliacao lista = snapshot.data as ListaUsuarioAvaliacao;

          if (lista.usuariosavaliacoes != null && lista.usuariosavaliacoes!.isNotEmpty) {
            selecionado = lista.usuariosavaliacoes!.first.avaliacao ?? 0;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextContrasteFonte(
                text: AppLocalizations.of(context)!.e_evaluation,
                style: GoogleFonts.inter(
                  fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                  fontWeight: FontWeight.w600,
                  color: corTextAtual,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: GestureDetector(
                      onTap: () async {
                        _confirmEvaluation(1);
                      },
                      child: Column(
                        children: [
                          widgetImagemInterna(
                            imagem: Imagem(
                              url: selecionado == 1
                                  ? 'liked_orange.png'
                                  : !Cores.contraste
                                      ? 'liked_black.png'
                                      : 'liked_white.png',
                            ),
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          TextContrasteFonte(
                            text: av1,
                            style: GoogleFonts.inter(
                              fontSize: fontePadrao,
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
                        _confirmEvaluation(2);
                      },
                      child: Column(
                        children: [
                          widgetImagemInterna(
                            imagem: Imagem(
                              url: selecionado == 2
                                  ? 'not_liked_orange.png'
                                  : !Cores.contraste
                                      ? 'not_liked_black.png'
                                      : 'not_liked_white.png',
                            ),
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          TextContrasteFonte(
                            text: av2,
                            style: GoogleFonts.inter(
                              fontSize: fontePadrao,
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
                        _confirmEvaluation(3);
                      },
                      child: Column(
                        children: [
                          widgetImagemInterna(
                            imagem: Imagem(
                              url: selecionado == 3
                                  ? 'closed_face_orange.png'
                                  : !Cores.contraste
                                      ? 'closed_face_black.png'
                                      : 'closed_face_white.png',
                            ),
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          TextContrasteFonte(
                            text: av3,
                            style: GoogleFonts.inter(
                              fontSize: fontePadrao,
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
    } else {
      return null;
    }
  }

  void _confirmEvaluation(int value) async {
    if (!app.isLog()) {
      widgetNotificaoPopUp(
          context: context,
          textDescritivo: AppLocalizations.of(context)!.e_alert_events,
          textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
          permitirFechar: true,
          funcaoBotao: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const pageLogin(),
              ),
            );
          });
      return;
    } else {
      TextEditingController tedComentario = TextEditingController();
      bool comentarioFeito = false;

      widgetNotificaoPopUp(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.e_alert_coments,
        textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
        textBotaoSecundario: AppLocalizations.of(context)!.e_alert_coments_no,
        permitirFechar: true,
        funcaoBotao: () async {
          await showFuturePopupDialog(
            context: context,
            edits: [
              EditPopup(
                edit: tedComentario,
                funcao: (v) {},
                tipo: EditPopupType.texto,
                titulo: AppLocalizations.of(context)!.e_alert_coments_title,
              ),
            ],
            funcaoBtnOk: () async {
              if (tedComentario.text.isEmpty) return false;
              comentarioFeito = true;
              return true;
            },
            titulo: AppLocalizations.of(context)!.e_alert_coments_title_two,
          ).whenComplete(() async {
            if (comentarioFeito == true) {
              UsuarioAvaliacaoController ucontroller = UsuarioAvaliacaoController();
              await ucontroller.UsuarioAvaliacaoPost(
                userguidid: app.GetGuidId(),
                avaliacao: value.toString(),
                eventoguidid: widget.evento.guidid!,
                token: app.GetToken(),
                comentario: tedComentario.text.isEmpty ? '' : tedComentario.text.toString(),
              );
              setState(() {
                Navigator.pop(context);
              });
            }
          });
        },
        funcaoBotaoSecundario: () async {
          UsuarioAvaliacaoController ucontroller = UsuarioAvaliacaoController();
          await ucontroller.UsuarioAvaliacaoPost(
            userguidid: app.GetGuidId(),
            avaliacao: value.toString(),
            eventoguidid: widget.evento.guidid!,
            token: app.GetToken(),
            comentario: tedComentario.text.isEmpty ? '' : tedComentario.text.toString(),
          );
          setState(() {
            Navigator.pop(context);
          });
        },
      );
    }
  }
}
