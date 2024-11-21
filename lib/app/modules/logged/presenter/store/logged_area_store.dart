import 'package:mobx/mobx.dart';

part 'logged_area_store.g.dart';

class LoggedAreaStore = LoggedAreaStoreBase with _$LoggedAreaStore;

abstract class LoggedAreaStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void dispose() {}
}
