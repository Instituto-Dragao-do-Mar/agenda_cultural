import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/splash_module.dart';
import 'package:agendacultural/app/modules/logged/logged_module.dart';
import 'package:agendacultural/app/modules/introduction/introduction_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton(AppStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      RouterApp.splashApp,
      module: SplashModule(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 0),
    );
    r.module(
      RouterApp.introduction,
      module: IntroductionModule(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 0),
    );
    r.module(
      RouterApp.logged,
      module: LoggedModule(),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 0),
    );
  }
}
