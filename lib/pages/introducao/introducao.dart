import 'package:agendacultural/controller/introducao_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/introducao_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbottombotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/fontes.dart';

class IntroducaoPage extends StatefulWidget {
  const IntroducaoPage({
    super.key,
    required this.destino,
  });

  final StatefulWidget destino;

  @override
  State<IntroducaoPage> createState() => _IntroducaoPageState();
}

class _IntroducaoPageState extends State<IntroducaoPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentStep = 1;
  TextEditingController ted = TextEditingController(text: '1');

  ListaIntroducao? listaIntroducao;

  Future<void> getdados() async {
    listaIntroducao ??= await IntroducaoController().introducaoGet(
      userguidid: "",
    );
  }

  void _onIntroEnd(context) {
    Dados.setBool('introducao', true);
    Dados.jaVisualizouIntroducao = true;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => widget.destino),
    );
  }

  final bool _showSkipButton = false;
  final bool _showBackButton = false;

  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdados(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: [
            Semantics(
              container: true,
              sortKey: const OrdinalSortKey(2),
              child: IntroductionScreen(
                isProgress: false,
                key: introKey,
                onChange: (value) {
                  currentStep = value + 1;
                  app.notify();
                },
                onDone: () => {
                  _onIntroEnd(context),
                },
                onSkip: () => _onIntroEnd(context),
                showBackButton: _showBackButton,
                showSkipButton: _showSkipButton,
                showDoneButton: false,
                skipSemantic: "Pular",
                backSemantic: "Voltar",
                back: const Text(
                  semanticsLabel: "Página Anterior",
                  'Anterior',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                skip: const Text(
                  semanticsLabel: "Pular para Introdução",
                  'Pular',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                next: Text(
                  AppLocalizations.of(context)!.int_button_forward,
                  semanticsLabel: "Proxima Página",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                done: const Text(
                  'Começar',
                  semanticsLabel: "Começar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                curve: Curves.linear,
                animationDuration: 500,
                controlsMargin: const EdgeInsets.all(0),
                controlsPadding: const EdgeInsets.all(16),
                dotsDecorator: const DotsDecorator(
                  size: Size(10.0, 10.0),
                  color: Color(0xFFBDBDBD),
                  activeSize: Size(10.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
                // isBottomSafeArea: true,
                // isTopSafeArea: true,
                pages: listaIntroducao?.introducoes?.map(
                  (e) {
                    return PageViewModel(
                      titleWidget: const SizedBox.shrink(),
                      bodyWidget: e.widget!,
                      image: widgetImagemInterna(
                        imagem: e.imagem!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      decoration: const PageDecoration(
                        contentMargin: EdgeInsets.all(0),
                        fullScreen: true,
                        bodyAlignment: Alignment.bottomLeft,
                        bodyFlex: 0,
                        footerFlex: 0,
                        bodyPadding: EdgeInsets.fromLTRB(25, 0, 25, 70),
                        imagePadding: EdgeInsets.zero,
                      ),
                      footer: e.ordem == 3
                          ? Container(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: widgetBottomBotao(
                                text: AppLocalizations.of(context)!
                                    .int_button_enter,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                function: () {
                                  abrirAlertDialogCookies(
                                    context,
                                    () => setState(() {}),
                                  );
                                  return;
                                },
                              ),
                            )
                          : const SizedBox.shrink(),
                    );
                  },
                ).toList(),
              ),
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 32,
                ),
                child: Consumer<AppModel>(
                  builder: (context, value, child) => WidgetStep(
                    totalSteps: 3,
                    currentStep: currentStep,
                    funcao: _onIntroEnd,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void abrirAlertDialogCookies(
    BuildContext context,
    void Function() atualizar,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 45,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.int_cookies_title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const widgetEspacoV(largura: 10),
                    widgetImagemInterna(
                      imagem: Imagem(
                        url: "cookies.png",
                      ),
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 8),
                Text(
                  AppLocalizations.of(context)!.int_cookies_subtitle,
                  semanticsLabel:
                      "Nós armazenamos dados temporariamente para melhorar"
                      " a sua experiência de navegação e recomendar conteúdo de seu interesse. "
                      "Ao recusar pode impossibilitar a utilização de alguns dos recursos.",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff999999),
                  ),
                ),
                const widgetEspacoH(altura: 16),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (Dados.idiomaSalvo.isEmpty) {
                            Dados.idiomaSalvo = 'pt';
                          }
                          Dados.setBool('cookies', false);
                          Dados.jaVisualizouCookies = false;
                          _onIntroEnd(context);
                          atualizar();
                        },
                        child: Container(
                          width: 164,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              color: corBackgroundLaranja,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              semanticsLabel: 'Botão recusar!',
                              AppLocalizations.of(context)!
                                  .int_cookies_button_decline,
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                color: corBackgroundLaranja,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const widgetEspacoV(largura: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (Dados.idiomaSalvo.isEmpty) {
                            Dados.idiomaSalvo = 'pt';
                          }
                          Dados.setBool('cookies', true);
                          Dados.setString('idioma', Dados.idiomaSalvo);
                          Dados.jaVisualizouCookies = true;
                          _onIntroEnd(context);
                          atualizar();
                        },
                        child: Container(
                          width: 164,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: gradientPrincipal,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              color: corBackgroundLaranja,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              semanticsLabel: 'Botão aceitar!',
                              AppLocalizations.of(context)!
                                  .int_cookies_button_accept,
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                color: corBg,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class WidgetStep extends StatelessWidget {
  const WidgetStep({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.funcao,
  });

  final int totalSteps;
  final int currentStep;
  final Function(BuildContext) funcao;

  @override
  Widget build(BuildContext context) {
    var de = AppLocalizations.of(context)!.int_card_page_number;
    return Column(
      children: [
        StepProgressIndicator(
          //mainAxisAlignment: MainAxisAlignment.center,
          totalSteps: totalSteps,
          currentStep: currentStep,
          //selectedGradientColor: gradientPrincipal,
          unselectedColor: Colors.grey,
          selectedColor: const Color(0xFFE83C3B),
        ),
        const widgetEspacoH(altura: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              container: true,
              label: "Página ",
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: RichText(
                    text: TextSpan(
                      text: currentStep.toString(),
                      style: Fontes.inter14W500EA5B0C(Fontes.tamanhoBase),
                      children: [
                        TextSpan(
                          text: " $de 3",
                          style: Fontes.inter14W500Grey(Fontes.tamanhoBase),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
