import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/app/modules/logged/features/map/presenter/handler/map_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/area_events.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    if (!mounted) super.initState();
    _handler.initialize(context);
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_handler.store.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 3, offset: const Offset(0, 0)),
                  ],
                ),
                child: _handler.store.isLoading
                    ? const SizedBox.shrink()
                    : GoogleMap(
                        initialCameraPosition: _handler.store.inicioCameraPosition,
                        markers: _handler.store.markers,
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                        },
                      ),
              ),
            ),
            AreaEventsWidget(
              exhibitionEvent: ExhibitionEvent.event,
              title: AppLocalizations.of(context)!.map_suggestion,
              events: _handler.appStore.events,
              spaces: _handler.appStore.spaces,
              categories: _handler.appStore.categories,
              favorites: _handler.appStore.favorites,
              user: _handler.appStore.userLogged,
            ),
          ],
        );
      },
    );
  }
}
