// ignore_for_file: camel_case_types

import 'package:agendacultural/controller/introducao_controller.dart';
import 'package:agendacultural/model/introducao_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

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

  ListaIntroducao? listaIntroducao;

  Future<void> getdados() async {
    listaIntroducao ??= await IntroducaoController().introducaoGet(
      userguidid: "",
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => widget.destino),
    );
  }

  final bool _showSkipButton = true;
  final bool _showBackButton = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdados(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        return IntroductionScreen(
          key: introKey,
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          showBackButton: _showBackButton,
          showSkipButton: _showSkipButton,
          
          back: const Text(
            'Anterior',
            style: TextStyle(
              //   fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          skip: const Text(
            'Pular',
            style: TextStyle(
              //   fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          next: const Text(
            "Próximo",
            style: TextStyle(
              //  fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          done: const Text(
            'Começar',
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
            child: ElevatedButton(
              child: const Text(
                'Ir para recursos de acessibilidade',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
          pages: listaIntroducao!.introducoes!.map(
            (e) {
              return PageViewModel(
                titleWidget: const SizedBox.shrink(),
                body: e.texto!,
                image: widgetImagem(
                  imagem:  e.imagem!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
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
        );
      },
    );
  }
}
