import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/store/home_store.dart';
import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
import 'package:agendacultural/pages/home/general/button_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/pages/my_location/page/my_location_page.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/categories/area_categories.dart';
import 'package:agendacultural/pages/home/location/area_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppModel app;
  final _homeStore = HomeStore();

  @override
  void initState() {
    app = context.read<AppModel>();
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_homeStore.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return Container(
          color: corBgAtual,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                AreaLocationWidget(
                  onTapNavigateLocation: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLocationPage()),
                  ),
                ),
                AreaCategoryWidget(
                  scrollController: _homeStore.scrollController,
                  categories: _homeStore.categories,
                  showAllCategories: _homeStore.allCategories,
                  selectedCategory: _homeStore.selectedCategory,
                  onTapExpandCategories: () => _homeStore.setAllCategories(!_homeStore.allCategories),
                  applyFilterCategory: (categoria) {
                    if (_homeStore.selectedCategory == categoria) {
                      _homeStore.selectedCategory = null;
                    } else {
                      _homeStore.selectedCategory = categoria;
                    }
                  },
                ),
                ButtonFilterWidget(
                  onTapNavigateFilter: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FiltroCompletoPage(),
                    ),
                  ),
                ),
                // const AreaEventWidget(exibicaoEvento: ExibicaoEvento.destaque),
                // const AreaEventWidget(exibicaoEvento: ExibicaoEvento.data),
                // const AreaSpaceWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _initializeData() async {
    _homeStore.setIsLoading(true);

    _homeStore.setCategories(await CategoriaController().categoriaGet());
    _homeStore.setEvents(await EventoController().eventoGet());
    _sortEvents();
    _homeStore.setSpaces(await EspacoController().espacoGet());

    _homeStore.setIsLoading(false);
  }

  void _sortEvents() {
    _homeStore.events.sort((a, b) {
      var dateTimeA = a.eventosdatas?.first.datahora;
      var dateTimeB = b.eventosdatas?.first.datahora;
      var dateA = DateTime.parse(dateTimeA!).toLocal();
      var dateB = DateTime.parse(dateTimeB!).toLocal();

      var compareResult = DateTime(dateA.year, dateA.month, dateA.day).compareTo(
        DateTime(dateB.year, dateB.month, dateB.day),
      );
      if (compareResult != 0) {
        return compareResult;
      }

      var daysToFinishA = _calculateDaysToFinish(a.eventosdatas?.first.datafim, dateTimeA);
      var daysToFinishB = _calculateDaysToFinish(b.eventosdatas?.first.datafim, dateTimeB);

      return daysToFinishA.compareTo(daysToFinishB);
    });
  }

  int _calculateDaysToFinish(String? dataFim, String? dataInicio) {
    if (dataFim != null) {
      var dataFimDateTime = DateTime.parse(dataFim);
      var dataInicioDateTime = DateTime.parse(dataInicio!);
      var diasParaFim = dataFimDateTime.day - dataInicioDateTime.day;
      return diasParaFim;
    }
    return 0;
  }
}
