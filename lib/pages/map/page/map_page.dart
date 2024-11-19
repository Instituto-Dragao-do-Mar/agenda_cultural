import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/map/store/map_store.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late AppModel app;
  final mapStore = MapStore();

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    _getMarkers();
  }

  @override
  void dispose() {
    mapStore.dispose();
    super.dispose();
  }

  Future<void> _getMarkers() async {
    mapStore.setIsLoading(true);

    mapStore.setAddress(await Dados.getString('local_atual_descricao'));

    // Definição do ponto inicial do mapa
    // Se o usuário permitir o acesso a localização atual, o mapa será centralizado na localização atual
    if (mapStore.address != '' || mapStore.address.isNotEmpty) {
      mapStore.setLatitude(await Dados.getDouble('local_atual_latitude'));
      mapStore.setLongitude(await Dados.getDouble('local_atual_longitude'));
      mapStore.setInicioCameraPosition(CameraPosition(target: LatLng(mapStore.latitude, mapStore.longitude), zoom: 11));
      mapStore.addMarker(
        Marker(
          markerId: const MarkerId('0'),
          position:
              LatLng(mapStore.inicioCameraPosition.target.latitude, mapStore.inicioCameraPosition.target.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: 'Minha Localização', snippet: '', onTap: () {}),
        ),
      );
    } else {
      // Se não houver localização atual, o mapa será centralizado no primeiro evento
      // if (app.listaEventos.eventos != null && app.listaEventos.eventos!.isNotEmpty) {
      //   int idespaco = app.listaEventos.eventos!.first.eventosdatas!.first.idespaco!;
      //   Espaco espaco = app.listaEspacos.espacos!.firstWhere((element) => element.id == idespaco);
      //
      //   mapStore.inicioCameraPosition = CameraPosition(
      //     target: LatLng(espaco.latitude ?? 0.0, espaco.longitude ?? 0.0),
      //     zoom: 11,
      //   );
      //   // Se não houver eventos, o mapa será centralizado em 'Fortaleza'
      // } else {
      //   mapStore.inicioCameraPosition = const CameraPosition(
      //     target: LatLng(-3.7608777226578134, -38.521393491712224),
      //     zoom: 11,
      //   );
      // }
    }

    // Adiciona os marcadores dos eventos no mapa (se houver)
    // if (app.listaEventos.eventos != null || app.listaEventos.eventos!.isNotEmpty) {
    //   for (Event event in app.listaEventos.eventos!) {
    //     int spaceEvent = event.eventosdatas!.first.idespaco!;
    //     Espaco space = app.listaEspacos.espacos!.firstWhere((element) => element.id == spaceEvent);
    //     mapStore.addMarker(
    //       Marker(
    //         markerId: MarkerId(space.id.toString()),
    //         position: LatLng(space.latitude ?? 0.0, space.longitude ?? 0.00),
    //         infoWindow: InfoWindow(
    //           title: event.nome ?? '',
    //           snippet: event.detalhe ?? '',
    //           onTap: () => Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const SizedBox(),//EventDetailPage(evento: event),
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   }
    // }

    mapStore.setIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: mapStore.isLoading
                    ? const SizedBox.shrink()
                    : GoogleMap(
                        initialCameraPosition: mapStore.inicioCameraPosition,
                        markers: mapStore.markers,
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                        },
                      ),
              ),
              // AreaEventsWidget(
              //   exibicaoEvento: ExhibitionEvent.event,
              //   titulo: AppLocalizations.of(context)!.map_suggestion,
              //   events: [],
              // ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
