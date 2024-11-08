import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = MapStoreBase with _$MapStore;

abstract class MapStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

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
  CameraPosition inicioCameraPosition = const CameraPosition(
    target: LatLng(-3.7608777226578134, -38.521393491712224),
    zoom: 11,
  );

  @action
  void setInicioCameraPosition(CameraPosition value) => inicioCameraPosition = value;

  @observable
  Set<Marker> markers = {};

  @action
  void addMarker(Marker value) => markers.add(value);

  @action
  void dispose() {
    setIsLoading(false);
    setAddress('');
    setLatitude(0.0);
    setLongitude(0.0);
    setInicioCameraPosition(const CameraPosition(
      target: LatLng(-3.7608777226578134, -38.521393491712224),
      zoom: 11,
    ));
    markers.clear();
  }
}
