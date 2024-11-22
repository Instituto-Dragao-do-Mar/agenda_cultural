import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_module.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/modules/auth/presenter/page/auth_page.dart';
import 'package:agendacultural/app/modules/auth/presenter/store/auth_store.dart';
import 'package:agendacultural/app/modules/auth/presenter/handler/auth_state_handler.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/signup_page.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/page/signin_page.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/store/signup_store.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/store/signin_store.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/handler/signup_state_handler.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/handler/signin_state_handler.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(AuthPageStateHandler.new);
    i.addLazySingleton(AuthStore.new);

    i.addLazySingleton(SigninPageStateHandler.new);
    i.addLazySingleton(SigninStore.new);

    i.addLazySingleton(SignupPageStateHandler.new);
    i.addLazySingleton(SignupStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const AuthPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.signin,
      child: (context) => const SignInPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.signup,
      child: (context) => const SignupPage(),
      transition: TransitionType.noTransition,
    );
  }
}
