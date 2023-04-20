// ignore_for_file: camel_case_types
import 'package:agendacultural/controller/introducao_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/introducao_model.dart';
import 'package:agendacultural/pages/home/acessibilidade/widgetacessibilidade.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetalertdialog.dart';
import 'package:agendacultural/shared/widgetbottombotao.dart';
import 'package:agendacultural/shared/widgetemdesenvolvimento.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../model/fontes.dart';

class pageIntroducao extends StatefulWidget {
  const pageIntroducao({
    super.key,
    required this.destino,
  });

  final StatefulWidget destino;

  @override
  State<pageIntroducao> createState() => _pageIntroducaoState();
}

class _pageIntroducaoState extends State<pageIntroducao> {
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
                // doneSemantic: "Começar",
                skipSemantic: "Pular",
                // nextSemantic: "Começar",
                backSemantic: "Voltar",
                back: const Text(
                  semanticsLabel: "Página Anterior",
                  'Anterior',
                  style: TextStyle(
                    //   fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                skip: const Text(
                  semanticsLabel: "Pular para Introdução",
                  'Pular',
                  style: TextStyle(
                    //   fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                next: const Text(
                  "Avançar",
                  semanticsLabel: "Proxima Página",
                  style: TextStyle(
                    //  fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                done: const Text(
                  'Começar',
                  semanticsLabel: "Começar",
                  style: TextStyle(
                    //  fontWeight: FontWeight.w600,
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
                isBottomSafeArea: true,
                isTopSafeArea: true,
                globalFooter: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Semantics(
                    container: true,
                    child: widgetBottomBotao(
                      text: "Ir para recursos de acessibilidade",
                      function: () {
                        if (!Dados.jaVisualizouCookies) {
                          widgetMensagem(
                            context: context,
                            text: "A acessibilidade só pode ser acessada se "
                                "você permitir o uso de cookies.",
                          );
                          return;
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const widgetAcessibilidade(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                pages: listaIntroducao!.introducoes!.map(
                  (e) {
                    return PageViewModel(
                      titleWidget: const SizedBox.shrink(),
                      body: e.texto!,
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
                        bodyPadding: EdgeInsets.fromLTRB(25, 0, 25, 70),
                        imagePadding: EdgeInsets.zero,
                        bodyTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ).toList(),
                /* dotsContainerDecorator: const ShapeDecoration(
                  color: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ), */
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
                  builder: (context, value, child) => widgetStep(
                    totalSteps: 3,
                    currentStep: currentStep,
                    funcao: _onIntroEnd,
                  ),
                ),
              ),
            ),
            if (!Dados.jaVisualizouCookies)
              const Positioned(
                child: Widgetalertdialog(),
              ),
          ],
        );
      },
    );
  }
}

class widgetStep extends StatelessWidget {
  const widgetStep({
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
        widgetEspacoH(altura: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              container: true,
              label: "Página "
              // "$currentStep de 3"
              ,
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
                              text: " de 3",
                              style: Fontes.inter14W500Grey(Fontes.tamanhoBase))
                        ]),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Dados.setBool('introducao', true);
                Dados.jaVisualizouIntroducao = true;
                funcao(context);
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Pular introdução",
                    style: Fontes.inter14W500Grey(Fontes.tamanhoBase),
                    semanticsLabel: "Pular Introdução",
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
