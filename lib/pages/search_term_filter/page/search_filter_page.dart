import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/search_term_filter/store/search_filter_store.dart';
import 'package:agendacultural/pages/search_term_filter/widgets/app_bar_search_filter.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  late AppModel app;
  final searchFilterStore = SearchFilterStore();

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    // searchFilterStore.setEventsFilter(app.listaEventos.eventos ?? []);
    // searchFilterStore.searchController.addListener(
    //   () => searchFilterStore.eventsFilter = app.listaEventos.eventos
    //           ?.where((event) =>
    //               event.nome?.toLowerCase().contains(searchFilterStore.searchController.text.toLowerCase()) ?? false)
    //           .toList() ??
    //       [],
    // );
  }

  @override
  void dispose() {
    searchFilterStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        surfaceTintColor: corBgAtual,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarSearchFilter(),
      ),
      body: Observer(
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 8),
              child: Text(
                AppLocalizations.of(context)!.schedule_filter_subtitle,
                style: TextStyle(
                  color: corTextAtual,
                  fontSize: FontsApp.tamanhoBase.toDouble(),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: searchFilterStore.searchController,
                      style: FontsApp.poppins14W400Grey(FontsApp.tamanhoBase),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.schedule_filter_subtitle,
                        hintStyle: FontsApp.poppins14W400Grey(FontsApp.tamanhoBase),
                        filled: true,
                        fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                        prefixIcon: Icon(Icons.search, color: corBackgroundLaranja),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Wrap(
            //       children: searchFilterStore.eventsFilter
            //           .map(
            //             (e) => Container(
            //               margin: EdgeInsets.only(bottom: e == searchFilterStore.eventsFilter.last ? 20 : 0),
            //               child: ItemEventWidget(
            //                 event: e,
            //                 spacePrincipal: Espaco(),
            //                 onTapEvent: () {},
            //               ),
            //             ),
            //           )
            //           .toList(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
