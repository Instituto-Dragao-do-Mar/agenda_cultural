// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/espacos/programacaoespaco.page.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/widgetNotificacaoPopUp.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
// import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../acesso/pagelogin.dart';

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
  int selecionado = 0;

  Espaco? espaco;
  List<Evento> eventos = [];

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
        leading: Semantics(
          container: false,
          label: "Voltar para tela anterior",
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: widgetImagemInterna(
              imagem: Imagem(url: 'seta.png'),
            ),
          ),
        ),
        centerTitle: false,
        title: TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_title_e,
          style: TextStyle(
            color: corTextAtual,
            fontSize: Fontes.tamanhoBase.toDouble(),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          body(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: widgetBotao(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              text: AppLocalizations.of(context)!.e_programming,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgramacaoEspacoPage(
                      espaco: espaco!,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const WidgetBottomNavigator(),
    );
  }

  Widget body() {
    var imagemEspaco = widget.espaco.espacosimagens?.first.imagens?.first.url;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: double.infinity),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * .7,
            child: Semantics(
              label: "Imagem do espaço",
              child: imagemEspaco == null
                  ? Image.asset(
                      'imagens/Outros - 1padrao.png',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imagemEspaco.replaceAll("homolog", ""),
                    ),
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
                    widgetEvDescricao(),
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
                    const widgetEspacoH(altura: 60),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column widgetEvDescricao() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_descr,
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
          trimCollapsedText: ' ${AppLocalizations.of(context)!.e_descr_more}',
          trimExpandedText: ' ${AppLocalizations.of(context)!.e_descr_less}',
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
          AppLocalizations.of(context)!.e_location,
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
  }

  Widget widgetEvAcessibilidade() {
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
    var textDesc = AppLocalizations.of(context)!.profile_general_alert;
    var textDescOk = AppLocalizations.of(context)!.profile_general_alert_accept;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_more_info,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - 2,
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
                Icon(
                  Icons.local_phone_rounded,
                  color: corBackgroundLaranja,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    widgetNotificaoPopUp(
                      context: context,
                      permitirFechar: true,
                      textDescritivo: textDesc,
                      textBotao: textDescOk,
                      funcaoBotao: () async {
                        var url = Uri.parse('https://www.google.com.br');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.platformDefault,
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    );
                  },
                  child: TextContrasteFonte(
                    text: AppLocalizations.of(context)!.e_more_info_scheduling,
                    style: GoogleFonts.inter(
                      decoration: TextDecoration.underline,
                      fontSize: Fontes.tamanhoBase - 2,
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget widgetEvAvaliarEspaco() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_evaluation_e,
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
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  confirmaparaAvaliar(1);
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
                      text: AppLocalizations.of(context)!.e_evaluation_one,
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                        fontWeight: FontWeight.w500,
                        color: corTextAtual,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  confirmaparaAvaliar(2);
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
                      text: AppLocalizations.of(context)!.e_evaluation_two,
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
                        fontWeight: FontWeight.w500,
                        color: corTextAtual,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  confirmaparaAvaliar(3);
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
                      text: AppLocalizations.of(context)!.e_evaluation_three_e,
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
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
      widgetNotificaoPopUp(
          context: context,
          textDescritivo: AppLocalizations.of(context)!.e_alert_spaces,
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
    }
    setState(() {
      value != 0 && selecionado != value ? selecionado = value : selecionado = 0;
    });
  }
}
