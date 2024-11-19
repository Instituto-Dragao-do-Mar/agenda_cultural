import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';

class SpaceDetailMapWidget extends StatelessWidget {
  final Space space;

  const SpaceDetailMapWidget({
    super.key,
    required this.space,
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
                  target: LatLng(space.latitude ?? 0, space.longitude ?? 0),
                  zoom: 16,
                ),
                markers: <Marker>{
                  Marker(
                    markerId: MarkerId(space.id.toString()),
                    position: LatLng(space.latitude ?? 0, space.longitude ?? 0),
                    infoWindow: InfoWindow(
                      title: space.nome ?? '',
                      snippet: space.detalhe ?? '',
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
