import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/modules/my_location/adapters/geo_location.dart';
import 'package:agendacultural/modules/my_location/store/my_location_store.dart';

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  final _myLocationStore = MyLocationStore();

  @override
  void initState() {
    super.initState();
    _getDataLocation();
  }

  @override
  void dispose() {
    _disposeDataLocation();
    super.dispose();
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
          label: 'Voltar para tela anterior',
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
          style: TextStyle(color: corTextAtual, fontSize: Fontes.tamanhoBase.toDouble()),
        ),
      ),
      body: Observer(
        builder: (context) {
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
                          controller: _myLocationStore.addressController,
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
                        onTap: _onTapSearch,
                        child: Icon(Icons.search, color: corBackgroundLaranja, size: 26),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: _onTapUseMyLocation,
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: corBackgroundLaranja),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.location_subtitle,
                            semanticsLabel: AppLocalizations.of(context)!.location_subtitle,
                            style: Fontes.poppins14W400E83C3B((Fontes.tamanhoBase)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                if (_myLocationStore.address != '' || _myLocationStore.address.isNotEmpty)
                  InkWell(
                    onTap: () => _myLocationStore.selected = !_myLocationStore.selected,
                    child: ListTile(
                      selected: _myLocationStore.selected,
                      leading: CircleAvatar(
                        backgroundColor: _myLocationStore.selected ? corBackgroundLaranja : const Color(0xff999999),
                        child: const Icon(Icons.touch_app_rounded, color: Colors.white, size: 20),
                      ),
                      title: Text(
                        _myLocationStore.address,
                        style: TextStyle(
                          fontSize: Fontes.tamanhoBase.toDouble(),
                          fontWeight: FontWeight.w400,
                          color: !Cores.contraste ? const Color(0XFF000000) : Colors.white,
                          height: 1.4,
                        ),
                      ),
                      subtitle: Text(
                        '${AppLocalizations.of(context)!.location_latitude} '
                        '${_myLocationStore.latitude.toStringAsFixed(8)}, '
                        '${AppLocalizations.of(context)!.location_longitude} '
                        '${_myLocationStore.longitude.toStringAsFixed(8)}.',
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
                          semanticsLabel: 'Usar minha localização atual.',
                          style: Fontes.poppins16W400Black((Fontes.tamanhoBase - 2)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _getDataLocation() async {
    _myLocationStore.setAddress(await Dados.getString('local_atual_descricao'));

    if (_myLocationStore.address != '' || _myLocationStore.address.isNotEmpty) {
      _myLocationStore.setLatitude(await Dados.getDouble('local_atual_latitude'));
      _myLocationStore.setLongitude(await Dados.getDouble('local_atual_longitude'));
      _myLocationStore.setSelected(true);
    }
  }

  void _disposeDataLocation() async {
    if (!_myLocationStore.selected) {
      await Dados.setDouble('local_atual_latitude', 0);
      await Dados.setDouble('local_atual_longitude', 0);
      await Dados.setString('local_atual_descricao', '');
    }
  }

  void _onTapSearch() async {
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
  }

  void _onTapUseMyLocation() async {
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
  }

  Future<void> _selectLocation(Position? position) async {
    final GeoData data;

    if (position != null) {
      data = await Geocoder2.getDataFromCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
        googleMapApiKey: 'AIzaSyD6N1Bi7N9NkV8VtpbI4L5aB6wDwxm82vA',
      );
    } else {
      data = await Geocoder2.getDataFromAddress(
        language: 'pt-BR',
        address: _myLocationStore.addressController.text,
        googleMapApiKey: 'AIzaSyDPiOz0fCI1sfLT3W2fe--unju-f2n9jbY',
      );
    }

    GeoLocation.localAtualLatitude = data.latitude;
    GeoLocation.localAtualLongitude = data.longitude;

    await Dados.setDouble('local_atual_latitude', data.latitude);
    await Dados.setDouble('local_atual_longitude', data.longitude);
    await Dados.setString('local_atual_descricao', data.address);

    _myLocationStore.setSelected(true);
    _myLocationStore.setAddress(data.address);
    _myLocationStore.setLatitude(data.latitude);
    _myLocationStore.setLongitude(data.longitude);
  }
}
