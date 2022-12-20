// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/pages/evento/pageeventodetalhe.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../model/fontes.dart';

class pageMapa extends StatefulWidget {
  const pageMapa({super.key});

  @override
  State<pageMapa> createState() => _pageMapaState();
}

class _pageMapaState extends State<pageMapa> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _inicioCameraPosition;
  Set<Marker> markers = {};
  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();

    if (app.listaEventos.eventos != null) {
      int idespaco =
          app.listaEventos.eventos!.first.eventosdatas!.first.idespaco!;
      Espaco espaco = app.listaEspacos.espacos!
          .firstWhere((element) => element.id == idespaco);

      _inicioCameraPosition = CameraPosition(
        target: LatLng(
          espaco.latitude ?? 0.0,
          espaco.longitude ?? 0.0,
        ),
        zoom: 11,
      );
    } else {
      _inicioCameraPosition = const CameraPosition(
        target: LatLng(
          -3.7608777226578134,
          -38.521393491712224,
        ),
        zoom: 11,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> processaMarkers() async {
    markers = {};

    for (Evento ev in app.listaEventos.eventos!) {
      int idespaco = ev.eventosdatas!.first.idespaco!;
      Espaco ep = app.listaEspacos.espacos!
          .firstWhere((element) => element.id == idespaco);
      markers.add(
        Marker(
          markerId: MarkerId(ep.id.toString()),
          position: LatLng(ep.latitude ?? 0.0, ep.longitude ?? 0.00),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          ),
          infoWindow: InfoWindow(
            title: ev.nome ?? '',
            snippet: ev.detalhe ?? '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pageEventoDetalhe(
                    evento: ev,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: processaMarkers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (p0, p1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: p1.maxWidth,
                      height: p1.maxWidth * 1.2,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: markers,
                        initialCameraPosition: _inicioCameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                          //_manager.setMapId(controller.mapId);
                        },
                        //onCameraMove: _manager.onCameraMove,
                        onCameraIdle: () {
                          // processaMarkers();
                          //_manager.updateMap();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sugestões',
                      style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class pageMapaTopo extends StatelessWidget {
  const pageMapaTopo({super.key});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: "Mapa",
      funcaoImagem2: () async {},
      urlImagem2: 'favoritos.png',
    );
  }
}
