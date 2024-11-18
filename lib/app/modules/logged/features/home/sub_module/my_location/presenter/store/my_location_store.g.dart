// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyLocationStore on MyLocationStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MyLocationStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$addressControllerAtom =
      Atom(name: 'MyLocationStoreBase.addressController', context: context);

  @override
  TextEditingController get addressController {
    _$addressControllerAtom.reportRead();
    return super.addressController;
  }

  @override
  set addressController(TextEditingController value) {
    _$addressControllerAtom.reportWrite(value, super.addressController, () {
      super.addressController = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'MyLocationStoreBase.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$latitudeAtom =
      Atom(name: 'MyLocationStoreBase.latitude', context: context);

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$longitudeAtom =
      Atom(name: 'MyLocationStoreBase.longitude', context: context);

  @override
  double get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: 'MyLocationStoreBase.selected', context: context);

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$MyLocationStoreBaseActionController =
      ActionController(name: 'MyLocationStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$MyLocationStoreBaseActionController.startAction(
        name: 'MyLocationStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$MyLocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$MyLocationStoreBaseActionController.startAction(
        name: 'MyLocationStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$MyLocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatitude(double value) {
    final _$actionInfo = _$MyLocationStoreBaseActionController.startAction(
        name: 'MyLocationStoreBase.setLatitude');
    try {
      return super.setLatitude(value);
    } finally {
      _$MyLocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLongitude(double value) {
    final _$actionInfo = _$MyLocationStoreBaseActionController.startAction(
        name: 'MyLocationStoreBase.setLongitude');
    try {
      return super.setLongitude(value);
    } finally {
      _$MyLocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelected(bool value) {
    final _$actionInfo = _$MyLocationStoreBaseActionController.startAction(
        name: 'MyLocationStoreBase.setSelected');
    try {
      return super.setSelected(value);
    } finally {
      _$MyLocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$MyLocationStoreBaseActionController.startAction(
        name: 'MyLocationStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$MyLocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
addressController: ${addressController},
address: ${address},
latitude: ${latitude},
longitude: ${longitude},
selected: ${selected}
    ''';
  }
}
