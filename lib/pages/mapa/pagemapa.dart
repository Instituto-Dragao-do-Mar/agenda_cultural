// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:async';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/pages/evento/pageeventodetalhe.dart';
import 'package:agendacultural/pages/evento/widgethomeeventos.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

    if (app.listaEventos.eventos != null &&
        app.listaEventos.eventos!.isNotEmpty) {
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
    BitmapDescriptor markerbitmapAzul = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(32, 32)),
      "imagens/markerazul.png",
    );

    BitmapDescriptor markerbitmapLaranja =
        await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(32, 32)),
      "imagens/markerlaranja.png",
    );

    double lat = await Dados.getDouble('local_atual_latitude');
    double lon = await Dados.getDouble('local_atual_longitude');

    if (lat != 0) {
      _inicioCameraPosition = CameraPosition(
        target: LatLng(
          lat,
          lon,
        ),
        zoom: 11,
      );
    }

    markers = {};

    /* print(
        " Minha localizacao: ${_inicioCameraPosition.target.latitude.toString()}");
    print(
        " Minha localizacao: ${_inicioCameraPosition.target.longitude.toString()}"); */

    markers.add(
      Marker(
        markerId: const MarkerId('0'),
        position: LatLng(_inicioCameraPosition.target.latitude,
            _inicioCameraPosition.target.longitude),
        icon: markerbitmapAzul,
        infoWindow: InfoWindow(
          title: 'Minha Localização',
          snippet: '',
          onTap: () {},
        ),
      ),
    );

    if (app.listaEventos.eventos == null || app.listaEventos.eventos!.isEmpty) {
      return;
    }

    for (Evento ev in app.listaEventos.eventos!) {
      int idespaco = ev.eventosdatas!.first.idespaco!;
      Espaco ep = app.listaEspacos.espacos!
          .firstWhere((element) => element.id == idespaco);
      markers.add(
        Marker(
          markerId: MarkerId(ep.id.toString()),
          position: LatLng(ep.latitude ?? 0.0, ep.longitude ?? 0.00),
          icon: markerbitmapLaranja,
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
    //return const Text("Sem eventos para visualizacão.");

    return FutureBuilder(
      future: processaMarkers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (app.listaEventos.eventos == null ||
            app.listaEventos.eventos!.isEmpty) {
          return const Text("Sem eventos para visualizacão.");
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
                    const widgetHomeEventos(
                      exibicaoEvento: ExibicaoEvento.Evento,
                      titulo: "Sugestões",
                    )
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
  Function? notify;

  pageMapaTopo({super.key, this.notify});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: "Mapa",
      funcaoImagem1: () async {
        notify!();
      },
      urlImagem1: 'seta.png',
      funcaoImagem2: () async {},
      urlImagem2: 'favoritos.png',
    );
  }
}
