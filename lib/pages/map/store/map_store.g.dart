// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapStore on MapStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MapStoreBase.isLoading', context: context);

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

  late final _$addressAtom =
      Atom(name: 'MapStoreBase.address', context: context);

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
      Atom(name: 'MapStoreBase.latitude', context: context);

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
      Atom(name: 'MapStoreBase.longitude', context: context);

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

  late final _$inicioCameraPositionAtom =
      Atom(name: 'MapStoreBase.inicioCameraPosition', context: context);

  @override
  CameraPosition get inicioCameraPosition {
    _$inicioCameraPositionAtom.reportRead();
    return super.inicioCameraPosition;
  }

  @override
  set inicioCameraPosition(CameraPosition value) {
    _$inicioCameraPositionAtom.reportWrite(value, super.inicioCameraPosition,
        () {
      super.inicioCameraPosition = value;
    });
  }

  late final _$markersAtom =
      Atom(name: 'MapStoreBase.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$MapStoreBaseActionController =
      ActionController(name: 'MapStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(String value) {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatitude(double value) {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.setLatitude');
    try {
      return super.setLatitude(value);
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLongitude(double value) {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.setLongitude');
    try {
      return super.setLongitude(value);
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInicioCameraPosition(CameraPosition value) {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.setInicioCameraPosition');
    try {
      return super.setInicioCameraPosition(value);
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMarker(Marker value) {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.addMarker');
    try {
      return super.addMarker(value);
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$MapStoreBaseActionController.startAction(
        name: 'MapStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$MapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
address: ${address},
latitude: ${latitude},
longitude: ${longitude},
inicioCameraPosition: ${inicioCameraPosition},
markers: ${markers}
    ''';
  }
}
