import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/core/data_preferences/data_preferences.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/domain/adapters/geo_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/store/my_location_store.dart';

class MyLocationPageStateHandler {
  final AppStore _appStore;

  MyLocationPageStateHandler(this._appStore);

  final MyLocationStore _store = Modular.get();

  MyLocationStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    _store.setAddress(await Dados.getString('local_atual_descricao'));

    if (_store.address != '' || _store.address.isNotEmpty) {
      _store.setLatitude(await Dados.getDouble('local_atual_latitude'));
      _store.setLongitude(await Dados.getDouble('local_atual_longitude'));
      _store.setSelected(true);
    }
  }

  void onTapSearch(BuildContext context, bool mounted) async {
    await EasyLoading.show(status: AppLocalizations.of(context)!.location_loading);
    try {
      await selectLocation(null);
    } catch (e) {
      if (!mounted) return;
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.location_error,
      );
    } finally {
      await EasyLoading.dismiss();
    }
  }

  void onTapUseMyLocation(BuildContext context, bool mounted) async {
    await EasyLoading.show(status: AppLocalizations.of(context)!.location_loading);

    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        if (!mounted) return;
        notifyPopUpWidget(
          context: context,
          description: AppLocalizations.of(context)!.location_no_permission,
        );
        await EasyLoading.dismiss();
        return;
      } else if (permission == LocationPermission.deniedForever) {
        if (!mounted) return;
        notifyPopUpWidget(
          context: context,
          description: AppLocalizations.of(context)!.location_no_permission,
        );
        await EasyLoading.dismiss();
        return;
      } else {
        var position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        );

        await selectLocation(position);
      }
    } else if (permission == LocationPermission.deniedForever) {
      if (!mounted) return;
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.location_no_permission,
      );
      await EasyLoading.dismiss();
      return;
    } else {
      var position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );

      await selectLocation(position);
    }

    await EasyLoading.dismiss();
  }

  Future<void> selectLocation(Position? position) async {
    LogController logController = LogController();

    if (position != null) {
      final List<Placemark> data;

      data = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      List<String> addressParts = [
        data[0].street?.isNotEmpty == true ? '${data[0].street!}, ' : '',
        data[0].name?.isNotEmpty == true ? '${data[0].name!} - ' : '',
        data[0].subLocality?.isNotEmpty == true ? '${data[0].subLocality!}, ' : '',
        data[0].subAdministrativeArea?.isNotEmpty == true ? '${data[0].subAdministrativeArea!} - ' : '',
        data[0].administrativeArea?.isNotEmpty == true ? '${data[0].administrativeArea!}, ' : '',
        data[0].postalCode?.isNotEmpty == true ? '${data[0].postalCode!}, ' : '',
        data[0].country?.isNotEmpty == true ? data[0].country! : ''
      ];

      String address = addressParts.where((part) => part.isNotEmpty).join('');

      GeoLocation.localAtualLatitude = position.latitude;
      GeoLocation.localAtualLongitude = position.longitude;

      await Dados.setDouble('local_atual_latitude', position.latitude);
      await Dados.setDouble('local_atual_longitude', position.longitude);
      await Dados.setString('local_atual_descricao', address);

      await logController.postLog(
        idLogTipo: 4,
        latitude: position.latitude,
        longitude: position.longitude,
        guidUsuario: _appStore.userLogged.guidid ?? '',
        observacao: 'Usuário '
            '${_appStore.userLogged.guidid != null ? '${_appStore.userLogged.nome}' : 'não identificado'}'
            ' ativou a localização atual',
      );

      _store.setSelected(true);
      _store.setAddress(address);
      _store.setLatitude(position.latitude);
      _store.setLongitude(position.longitude);
    } else {
      final List<Location> location;

      location = await locationFromAddress(_store.addressController.text);

      final List<Placemark> data;

      data = await placemarkFromCoordinates(
        location.first.latitude,
        location.first.longitude,
      );

      List<String> addressParts = [
        data[0].street?.isNotEmpty == true ? '${data[0].street!}, ' : '',
        data[0].name?.isNotEmpty == true ? '${data[0].name!} - ' : '',
        data[0].subLocality?.isNotEmpty == true ? '${data[0].subLocality!}, ' : '',
        data[0].subAdministrativeArea?.isNotEmpty == true ? '${data[0].subAdministrativeArea!} - ' : '',
        data[0].administrativeArea?.isNotEmpty == true ? '${data[0].administrativeArea!}, ' : '',
        data[0].postalCode?.isNotEmpty == true ? '${data[0].postalCode!}, ' : '',
        data[0].country?.isNotEmpty == true ? data[0].country! : ''
      ];

      String address = addressParts.where((part) => part.isNotEmpty).join('');

      GeoLocation.localAtualLatitude = location.first.latitude;
      GeoLocation.localAtualLongitude = location.first.longitude;

      await Dados.setDouble('local_atual_latitude', location.first.latitude);
      await Dados.setDouble('local_atual_longitude', location.first.longitude);
      await Dados.setString('local_atual_descricao', address);

      await logController.postLog(
        idLogTipo: 4,
        latitude: location.first.latitude,
        longitude: location.first.longitude,
        guidUsuario: _appStore.userLogged.guidid ?? '',
        observacao: 'Usuário '
            '${_appStore.userLogged.guidid != null ? '${_appStore.userLogged.nome}' : 'não identificado'}'
            ' pesquisou uma localização',
      );

      _store.setSelected(true);
      _store.setAddress(address);
      _store.setLatitude(location.first.latitude);
      _store.setLongitude(location.first.longitude);
    }
  }

  void dispose() async {
    if (!_store.selected) {
      await Dados.setDouble('local_atual_latitude', 0);
      await Dados.setDouble('local_atual_longitude', 0);
      await Dados.setString('local_atual_descricao', '');
    }
    _store.dispose();
  }
}
