import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/model/geolocalizacao_model.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/my_location/store/my_location_store.dart';

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  late AppModel app;
  final myLocationStore = MyLocationStore();

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    _getDataLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeDataLocation();
  }

  Future<void> _getDataLocation() async {
    myLocationStore.setAddress(await Dados.getString('local_atual_descricao'));

    if (myLocationStore.address != '' || myLocationStore.address.isNotEmpty) {
      myLocationStore.setLatitude(await Dados.getDouble('local_atual_latitude'));
      myLocationStore.setLongitude(await Dados.getDouble('local_atual_longitude'));
      myLocationStore.setSelected(true);
    }
  }

  Future<void> _disposeDataLocation() async {
    if (!myLocationStore.selected) {
      await Dados.setDouble('local_atual_latitude', 0);
      await Dados.setDouble('local_atual_longitude', 0);
      await Dados.setString('local_atual_descricao', '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        automaticallyImplyLeading: false,
        leadingWidth: 46,
        leading: Semantics(
          container: false,
          label: "Voltar para tela anterior",
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 8),
              child: SvgPicture.asset('imagens/icon_arrow_back.svg'),
            ),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: TextContrasteFonte(
          text: AppLocalizations.of(context)!.location_title,
          style: TextStyle(
            color: corTextAtual,
            fontSize: Fontes.tamanhoBase.toDouble(),
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      margin: const EdgeInsets.only(left: 16),
                      child: TextField(
                        controller: myLocationStore.addressController,
                        style: Fontes.poppins16W400Grey(Fontes.tamanhoBase),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.location_search,
                          hintStyle: Fontes.poppins14W400Grey(Fontes.tamanhoBase),
                          filled: true,
                          fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await EasyLoading.show(status: AppLocalizations.of(context)!.location_loading);
                        try {
                          await _selectLocation(null);
                        } catch (e) {
                          if (!mounted) return;
                          notifyPopUpWidget(
                            context: context,
                            textDescritivo: AppLocalizations.of(context)!.location_error,
                          );
                        } finally {
                          await EasyLoading.dismiss();
                        }
                      },
                      child: Icon(
                        Icons.search,
                        color: corBackgroundLaranja,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () async {
                    await EasyLoading.show(status: AppLocalizations.of(context)!.location_loading);

                    LocationPermission permission;

                    permission = await Geolocator.checkPermission();

                    if (permission == LocationPermission.denied) {
                      permission = await Geolocator.requestPermission();

                      if (permission == LocationPermission.denied) {
                        if (!mounted) return;
                        notifyPopUpWidget(
                          context: context,
                          textDescritivo: AppLocalizations.of(context)!.location_no_permission,
                        );
                        await EasyLoading.dismiss();
                        return;
                      } else if (permission == LocationPermission.deniedForever) {
                        if (!mounted) return;
                        notifyPopUpWidget(
                          context: context,
                          textDescritivo: AppLocalizations.of(context)!.location_no_permission,
                        );
                        await EasyLoading.dismiss();
                        return;
                      } else {
                        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                        await _selectLocation(position);
                      }
                    } else if (permission == LocationPermission.deniedForever) {
                      if (!mounted) return;
                      notifyPopUpWidget(
                        context: context,
                        textDescritivo: AppLocalizations.of(context)!.location_no_permission,
                      );
                      await EasyLoading.dismiss();
                      return;
                    } else {
                      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                      await _selectLocation(position);
                    }

                    await EasyLoading.dismiss();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: corBackgroundLaranja,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Usar minha localização",
                          semanticsLabel: "Usar minha localização atual",
                          style: Fontes.poppins14W400E83C3B((Fontes.tamanhoBase)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              if (myLocationStore.address != '' || myLocationStore.address.isNotEmpty)
                InkWell(
                  onTap: () => myLocationStore.selected = !myLocationStore.selected,
                  child: ListTile(
                    selected: myLocationStore.selected,
                    leading: CircleAvatar(
                      backgroundColor: myLocationStore.selected ? corBackgroundLaranja : const Color(0xff999999),
                      child: const Icon(Icons.touch_app_rounded, color: Colors.white, size: 20),
                    ),
                    title: Text(
                      myLocationStore.address,
                      style: TextStyle(
                        fontSize: Fontes.tamanhoBase.toDouble(),
                        fontWeight: FontWeight.w400,
                        color: !Cores.contraste ? const Color(0XFF000000) : Colors.white,
                        height: 1.4,
                      ),
                    ),
                    subtitle: Text(
                      "${AppLocalizations.of(context)!.location_latitude} "
                      "${myLocationStore.latitude.toStringAsFixed(8)}, "
                      "${AppLocalizations.of(context)!.location_longitude} "
                      "${myLocationStore.longitude.toStringAsFixed(8)}.",
                    ),
                    subtitleTextStyle: Fontes.poppins14W400Grey(Fontes.tamanhoBase - 2),
                    selectedColor: corBackgroundLaranja,
                  ),
                ),
              const Divider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: corBackgroundLaranja,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.location_unselected,
                        semanticsLabel: "Usar minha localização atual.",
                        style: Fontes.poppins16W400Black((Fontes.tamanhoBase - 2)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: const WidgetBottomNavigator(),
    );
  }

  Future<void> _selectLocation(Position? position) async {
    final GeoData data;

    if (position != null) {
      data = await Geocoder2.getDataFromCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
        googleMapApiKey: "AIzaSyD6N1Bi7N9NkV8VtpbI4L5aB6wDwxm82vA",
      );
    } else {
      data = await Geocoder2.getDataFromAddress(
        language: 'pt-BR',
        address: myLocationStore.addressController.text,
        googleMapApiKey: "AIzaSyDPiOz0fCI1sfLT3W2fe--unju-f2n9jbY",
      );
    }

    GeoLocalizacao.local_atual_latitude = data.latitude;
    GeoLocalizacao.local_atual_longitude = data.longitude;

    await Dados.setDouble('local_atual_latitude', data.latitude);
    await Dados.setDouble('local_atual_longitude', data.longitude);
    await Dados.setString('local_atual_descricao', data.address);

    myLocationStore.setSelected(true);
    myLocationStore.setAddress(data.address);
    myLocationStore.setLatitude(data.latitude);
    myLocationStore.setLongitude(data.longitude);
  }
}
