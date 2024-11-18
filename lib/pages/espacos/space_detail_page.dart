import 'package:agendacultural/app/common/utils/tradutors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/espacos/programacaoespaco.page.dart';

class SpaceDetailPage extends StatefulWidget {
  final Espaco espaco;

  const SpaceDetailPage({
    super.key,
    required this.espaco,
  });

  @override
  State<SpaceDetailPage> createState() => _SpaceDetailPageState();
}

class _SpaceDetailPageState extends State<SpaceDetailPage> {
  late AppModel app;
  late CameraPosition inicioCamera;
  Espaco? espaco;

  int selecionado = 0;
  Set<Marker> markers = {};
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
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
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
          _buildBody(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: widgetBotao(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              text: AppLocalizations.of(context)!.e_programming,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgramacaoEspacoPage(
                    espaco: espaco!,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const WidgetBottomNavigator(),
    );
  }

  Widget _buildBody() {
    var imagemEspaco = widget.espaco.espacosimagens?.first.imagens?.first.url;

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
              label: "Imagem do espaço",
              child: imagemEspaco == null
                  ? Image.asset(
                      'imagens/Outros - 1padrao.png',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imagemEspaco.replaceAll("homolog", ""),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: LayoutBuilder(
              builder: (p0, p1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    TextContrasteFonte(
                      text: widget.espaco.nome ?? "Nome do Espaço",
                      style: GoogleFonts.inter(
                        fontSize: Fontes.tamanhoBase.toDouble(),
                        fontWeight: FontWeight.w600,
                        color: corTextAtual,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    _buildEvaluation(),
                    const SizedBox(height: 60),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        if (app.GetEnderecoEspaco(widget.espaco) != '') const SizedBox(height: 5),
        if (app.GetEnderecoEspaco(widget.espaco) != '')
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
        String acessTrad = getNomeAcessib(acessibilidade, context);
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
                SvgPicture.asset(
                  'imagens/icon_phone.svg',
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async => notifyPopUpWidget(
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
                  ),
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

  Widget _buildEvaluation() {
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
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => _confirmEvaluation(1),
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
                onTap: () => _confirmEvaluation(2),
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
                onTap: () => _confirmEvaluation(3),
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

  void _confirmEvaluation(int value) {
    if (!app.isLog()) {
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.e_alert_spaces,
        textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
        permitirFechar: true,
        funcaoBotao: () async => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const pageLogin(),
          ),
        ),
      );
      return;
    }
    setState(() => value != 0 && selecionado != value ? selecionado = value : selecionado = 0);
  }
}
