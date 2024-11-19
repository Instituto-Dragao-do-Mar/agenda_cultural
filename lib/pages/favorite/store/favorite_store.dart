import 'package:mobx/mobx.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';

part 'favorite_store.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  List<Favorite> favorites = [];

  @action
  void setFavorites(List<Favorite> value) => favorites = value;

  @observable
  List<Event> eventsFavorite = [];

  @action
  void setListEventsFavorite(List<Event> value) => eventsFavorite = value;

  @action
  void dispose() {}
}
