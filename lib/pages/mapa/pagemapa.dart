// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  @override
  void initState() {
    super.initState();
    
    _inicioCameraPosition = const CameraPosition(
      target: LatLng(
       -3.7608777226578134, -38.521393491712224
       
      ),
      zoom: 16,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (p0, p1) {
            //print(p1.biggest);

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxWidth*1.2,
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
