import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/home/general/header_areas_home.dart';
import 'package:agendacultural/pages/home/category/item_category_filter.dart';

class AreaCategoryWidget extends StatefulWidget {
  const AreaCategoryWidget({super.key});

  @override
  State<AreaCategoryWidget> createState() => _AreaCategoryWidgetState();
}

class _AreaCategoryWidgetState extends State<AreaCategoryWidget> {
  ScrollController scrollController = ScrollController();

  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        HeaderCardsCategoryWidget(
          titulo: AppLocalizations.of(context)!.home_categories,
          subtitulo: Dados.verTodasCategorias
              ? AppLocalizations.of(context)!.home_categories_less
              : AppLocalizations.of(context)!.home_categories_all,
          funcao: () async {
            Dados.verTodasCategorias = !Dados.verTodasCategorias;
            await Dados.setBool('categorias', Dados.verTodasCategorias);
            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: Dados.verTodasCategorias ? null : 130,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            scrollDirection: Dados.verTodasCategorias ? Axis.vertical : Axis.horizontal,
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: app.listaCategoria.categorias!.map(
                (e) {
                  if (e.imagens == null || e.imagens!.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: !Dados.verTodasCategorias
                        ? e == app.listaCategoria.categorias!.first
                            ? const EdgeInsets.symmetric(horizontal: 8)
                            : const EdgeInsets.only(right: 8)
                        : const EdgeInsets.symmetric(horizontal: 8),
                    child: ItemCategoryFilterWidget(categoria: e),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
