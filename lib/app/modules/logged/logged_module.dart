import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_module.dart';
import 'package:agendacultural/app/modules/logged/presenter/page/logged_area_page.dart';
import 'package:agendacultural/app/modules/logged/presenter/store/logged_area_store.dart';
import 'package:agendacultural/app/modules/logged/presenter/handler/logged_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/store/home_store.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/handler/home_state_handler.dart';

class LoggedModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(LoggedPageStateHandler.new);
    i.addLazySingleton(LoggedAreaStore.new);

    i.addLazySingleton(HomePageStateHandler.new);
    i.addLazySingleton(HomeStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const LoggedAreaPage(),
    );
  }
}
