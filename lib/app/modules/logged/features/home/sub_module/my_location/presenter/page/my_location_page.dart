import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/page/widgets/my_location_app_bar.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/handler/my_location_state_handler.dart';

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  final MyLocationPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    if (!mounted) super.initState();
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: const MyLocationAppBar(),
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
                          controller: _handler.store.addressController,
                          style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.location_search,
                            hintStyle: FontsApp.poppins14W400Grey(FontsApp.tamanhoBase),
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
                        onTap: () => _handler.onTapSearch(context, mounted),
                        child: Icon(Icons.search, color: corBackgroundLaranja, size: 26),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () => _handler.onTapUseMyLocation(context, mounted),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: corBackgroundLaranja),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.location_subtitle,
                            semanticsLabel: AppLocalizations.of(context)!.location_subtitle,
                            style: FontsApp.poppins14W400E83C3B((FontsApp.tamanhoBase)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                if (_handler.store.address != '' || _handler.store.address.isNotEmpty)
                  InkWell(
                    onTap: () => _handler.store.selected = !_handler.store.selected,
                    child: ListTile(
                      selected: _handler.store.selected,
                      leading: CircleAvatar(
                        backgroundColor: _handler.store.selected ? corBackgroundLaranja : const Color(0xff999999),
                        child: const Icon(Icons.touch_app_rounded, color: Colors.white, size: 20),
                      ),
                      title: Text(
                        _handler.store.address,
                        style: TextStyle(
                          fontSize: FontsApp.tamanhoBase.toDouble(),
                          fontWeight: FontWeight.w400,
                          color: !ColorsApp.contraste ? const Color(0XFF000000) : Colors.white,
                          height: 1.4,
                        ),
                      ),
                      subtitle: Text(
                        '${AppLocalizations.of(context)!.location_latitude} '
                        '${_handler.store.latitude.toStringAsFixed(8)}, '
                        '${AppLocalizations.of(context)!.location_longitude} '
                        '${_handler.store.longitude.toStringAsFixed(8)}.',
                      ),
                      subtitleTextStyle: FontsApp.poppins14W400Grey(FontsApp.tamanhoBase - 2),
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
                          style: FontsApp.poppins16W400Black((FontsApp.tamanhoBase - 2)),
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
}
