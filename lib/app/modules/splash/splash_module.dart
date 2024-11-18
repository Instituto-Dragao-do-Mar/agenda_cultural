import 'package:agendacultural/app/modules/splash/presenter/handler/splash_state_handler.dart';
import 'package:agendacultural/app/modules/splash/presenter/store/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_module.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/modules/splash/presenter/page/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(SplashStore.new);
    i.addLazySingleton(SplashPageStateHandler.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      RouterApp.splashApp,
      child: (context) => const SplashPage(),
    );
  }
}
