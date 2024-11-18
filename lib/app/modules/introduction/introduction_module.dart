import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_module.dart';
import 'package:agendacultural/app/modules/introduction/presenter/page/introduction_page.dart';
import 'package:agendacultural/app/modules/introduction/presenter/store/introduction_store.dart';
import 'package:agendacultural/app/modules/introduction/presenter/handler/introduction_state_handler.dart';

class IntroductionModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(IntroductionStore.new);
    i.addLazySingleton(IntroductionPageStateHandler.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const IntroductionPage(),
    );
  }
}
