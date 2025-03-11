import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';

class EventDetailMapWidget extends StatelessWidget {
  final Space spaceReal;
  final Event event;
  final User user;

  const EventDetailMapWidget({
    super.key,
    required this.spaceReal,
    required this.event,
    required this.user,
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
                onMapCreated: (_) async {
                  LogController logController = LogController();

                  await logController.postLog(
                    idLogTipo: 2,
                    latitude: spaceReal.latitude ?? 0,
                    longitude: spaceReal.longitude ?? 0,
                    guidUsuario: user.guidid ?? '',
                    observacao: 'Usuário ${user.guidid != null ? '${user.nome}' : 'não identificado'} '
                        'visualizou o mapa do evento ${event.id}',
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
