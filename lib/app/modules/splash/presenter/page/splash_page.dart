import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/app/modules/splash/presenter/handler/splash_state_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();
    _handler.initialize(mounted, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientPrincipal),
        child: Center(
          child: Image.asset('imagens/logo_idm_white.png', height: 200, width: 200),
        ),
      ),
    );
  }
}
