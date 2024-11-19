import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/map/presenter/store/map_store.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail.dart';

class MapPageStateHandler {
  final AppStore _appStore;

  MapPageStateHandler(this._appStore);

  final MapStore _store = Modular.get();

  MapStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize(BuildContext context) async {
    _store.setIsLoading(true);
    await Future.delayed(const Duration(seconds: 1));

    _store.setAddress(await Dados.getString('local_atual_descricao'));

    // Definição do ponto inicial do mapa
    // Se o usuário permitir o acesso a localização atual, o mapa será centralizado na localização atual
    if (_store.address != '' || _store.address.isNotEmpty) {
      _store.setLatitude(await Dados.getDouble('local_atual_latitude'));
      _store.setLongitude(await Dados.getDouble('local_atual_longitude'));
      _store.setInicioCameraPosition(CameraPosition(target: LatLng(_store.latitude, _store.longitude), zoom: 11));
      _store.addMarker(
        Marker(
          markerId: const MarkerId('0'),
          position: LatLng(_store.inicioCameraPosition.target.latitude, _store.inicioCameraPosition.target.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(
            title: 'Minha Localização',
            snippet: _store.address,
            onTap: () {},
          ),
        ),
      );
    } else {
      // Se não houver localização atual, o mapa será centralizado no primeiro evento
      if (appStore.events.isNotEmpty) {
        int idespaco = appStore.events.first.eventosdatas?.first.idespaco ?? 0;
        Space espaco = appStore.spaces.firstWhere((element) => element.id == idespaco);

        _store.inicioCameraPosition = CameraPosition(
          target: LatLng(espaco.latitude ?? 0.0, espaco.longitude ?? 0.0),
          zoom: 11,
        );
        // Se não houver eventos, o mapa será centralizado em 'Fortaleza'
      } else {
        _store.inicioCameraPosition = const CameraPosition(
          target: LatLng(-3.7608777226578134, -38.521393491712224),
          zoom: 11,
        );
      }
    }

    // Adiciona os marcadores dos eventos no mapa (se houver)
    if (appStore.events.isNotEmpty) {
      for (Event event in appStore.events) {
        var eventsDate = event.eventosdatas!.first;
        Space spaceReal = appStore.spaces.firstWhere((element) => element.id == eventsDate.idespaco);
        Space spacePrincipal;
        if (spaceReal.idespacoprincipal == 0) {
          spacePrincipal = spaceReal;
        } else {
          spacePrincipal = appStore.spaces.firstWhere((element) => element.id == spaceReal.idespacoprincipal);
        }

        _store.addMarker(
          Marker(
            markerId: MarkerId(spaceReal.id.toString()),
            position: LatLng(spaceReal.latitude ?? 0.0, spaceReal.longitude ?? 0.00),
            infoWindow: InfoWindow(
              title: event.nome ?? '',
              snippet: event.detalhe ?? '',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetail(
                    event: event,
                    spaceReal: spaceReal,
                    spacePrincipal: spacePrincipal,
                    categories: appStore.categories,
                    favorites: appStore.favorites,
                    user: appStore.userLogged,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    _store.setIsLoading(false);
  }

  void dispose() => _store.dispose();
}
