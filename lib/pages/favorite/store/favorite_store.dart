import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:mobx/mobx.dart';

part 'favorite_store.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ListaFavoritos favorites = ListaFavoritos();

  @action
  void setFavorites(ListaFavoritos value) => favorites = value;

  @observable
  List<Evento> eventsFavorite = [];

  @action
  void setListEventsFavorite(List<Evento> value) => eventsFavorite = value;

  @action
  void dispose() {}
}
