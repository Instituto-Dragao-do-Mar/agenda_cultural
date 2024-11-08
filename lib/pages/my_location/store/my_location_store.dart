import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'my_location_store.g.dart';

class MyLocationStore = MyLocationStoreBase with _$MyLocationStore;

abstract class MyLocationStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  TextEditingController addressController = TextEditingController();

  @observable
  String address = '';

  @action
  void setAddress(String value) => address = value;

  @observable
  double latitude = 0.0;

  @action
  void setLatitude(double value) => latitude = value;

  @observable
  double longitude = 0.0;

  @action
  void setLongitude(double value) => longitude = value;

  @observable
  bool selected = false;

  @action
  void setSelected(bool value) => selected = value;

  @action
  void dispose() {}
}
