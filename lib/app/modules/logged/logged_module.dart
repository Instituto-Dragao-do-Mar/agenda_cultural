import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_module.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/modules/logged/presenter/page/logged_area_page.dart';
import 'package:agendacultural/app/modules/logged/presenter/store/logged_area_store.dart';
import 'package:agendacultural/app/modules/logged/features/map/presenter/store/map_store.dart';
import 'package:agendacultural/app/modules/logged/presenter/handler/logged_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/store/home_store.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/store/profile_store.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/store/schedule_store.dart';
import 'package:agendacultural/app/modules/logged/features/map/presenter/handler/map_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/filters_page.dart';
import 'package:agendacultural/app/modules/logged/features/favorites/presenter/store/favorite_store.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/handler/home_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/store/filters_store.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/handler/profile_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/handler/schedule_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/favorites/presenter/handler/favorite_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/handler/filters_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/language/presenter/page/language_page.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/language/presenter/store/language_store.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/page/my_location_page.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/store/my_location_store.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/accessibility/presenter/page/accessibility_page.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/language/presenter/handler/language_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/accessibility/presenter/store/accessibility_store.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/submodule/search_term_filter/presenter/page/search_filter_page.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/handler/my_location_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/submodule/search_term_filter/presenter/store/search_filter_store.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/accessibility/presenter/handler/accessibility_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/submodule/search_term_filter/presenter/handler/search_filter_state_handler.dart';

class LoggedModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(LoggedPageStateHandler.new);
    i.addLazySingleton(LoggedAreaStore.new);

    i.addLazySingleton(MyLocationPageStateHandler.new);
    i.addLazySingleton(MyLocationStore.new);

    i.addLazySingleton(FiltersPageStateHandler.new);
    i.addLazySingleton(FiltersStore.new);

    i.addLazySingleton(SearchFilterPageStateHandler.new);
    i.addLazySingleton(SearchFilterStore.new);

    i.addLazySingleton(AccessibilityPageStateHandler.new);
    i.addLazySingleton(AccessibilityStore.new);

    i.addLazySingleton(LanguagePageStateHandler.new);
    i.addLazySingleton(LanguageStore.new);

    //Principals pages

    i.addLazySingleton(HomePageStateHandler.new);
    i.addLazySingleton(HomeStore.new);

    i.addLazySingleton(SchedulePageStateHandler.new);
    i.addLazySingleton(ScheduleStore.new);

    i.addLazySingleton(MapPageStateHandler.new);
    i.addLazySingleton(MapStore.new);

    i.addLazySingleton(FavoritePageStateHandler.new);
    i.addLazySingleton(FavoriteStore.new);

    i.addLazySingleton(ProfilePageStateHandler.new);
    i.addLazySingleton(ProfileStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const LoggedAreaPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.myLocation,
      child: (context) => const MyLocationPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.filters,
      child: (context) => const FiltersPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.searchFilter,
      child: (context) => const SearchFilterPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.accessibility,
      child: (context) => const ProfileAccessibilityPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      RouterApp.language,
      child: (context) => const ProfileLanguagePage(),
      transition: TransitionType.noTransition,
    );
  }
}
