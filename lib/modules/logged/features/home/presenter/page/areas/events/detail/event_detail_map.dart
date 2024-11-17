import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';

class EventDetailMapWidget extends StatelessWidget {
  final Espaco spaceReal;
  final Evento event;

  const EventDetailMapWidget({
    super.key,
    required this.spaceReal,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth * 0.5,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(spaceReal.latitude ?? 0, spaceReal.longitude ?? 0),
                  zoom: 16,
                ),
                markers: <Marker>{
                  Marker(
                    markerId: MarkerId(event.id.toString()),
                    position: LatLng(spaceReal.latitude ?? 0, spaceReal.longitude ?? 0),
                    infoWindow: InfoWindow(
                      title: event.nome ?? '',
                      snippet: event.detalhe ?? '',
                    ),
                  ),
                },
                gestureRecognizers: {
                  Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
