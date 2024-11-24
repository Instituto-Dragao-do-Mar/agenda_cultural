import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/home/app_bar_common.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/button_big.dart';
import 'package:agendacultural/pages/filtro/widgets/filter_ticket.dart';
import 'package:agendacultural/pages/filtro/widgets/filter_periode.dart';
import 'package:agendacultural/pages/filtro/widgets/filter_category.dart';
import 'package:agendacultural/pages/filtro/widgets/filter_accessibility.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/area_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/page/my_location_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late AppModel app;
  int? fonte;
  bool? contraste = false;

  GroupButtonOptions options = GroupButtonOptions(
    selectedShadow: const [],
    selectedTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
    selectedColor: corBackgroundLaranja,
    unselectedShadow: const [],
    unselectedColor: corBackgroundNegative,
    unselectedTextStyle: TextStyle(fontSize: 12, color: Colors.amber[900]),
    selectedBorderColor: corBackgroundLaranja,
    unselectedBorderColor: corBackgroundLaranja,
    borderRadius: BorderRadius.circular(5),
    spacing: 10,
    runSpacing: 10,
    groupingType: GroupingType.wrap,
    direction: Axis.horizontal,
    mainGroupAlignment: MainGroupAlignment.start,
    crossGroupAlignment: CrossGroupAlignment.start,
    groupRunAlignment: GroupRunAlignment.start,
    textAlign: TextAlign.center,
    textPadding: EdgeInsets.zero,
    alignment: Alignment.center,
    elevation: 0,
  );

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarCommonWidget(
              labelGeneral: AppLocalizations.of(context)!.home_filter,
              functionImage1: () async {
                Navigator.pop(context);
              },
              urlImage1: 'seta.png',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                trackVisibility: true,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: listadeFiltros(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ButtonBig(
              function: () {},
              text: AppLocalizations.of(context)!.profile_accessibility_save,
            ),
          ],
        ),
      ),
    );
  }

  Widget listadeFiltros() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_location,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
        ),
        AreaLocationWidget(
          onTapNavigateLocation: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyLocationPage()),
          ),
        ),
        const SizedBox(height: 16),
        // widgetfiltroespaco(
        //   app: app,
        //   options: options,
        //   tedEspaco: app.tedEspaco,
        // ),
        // const widgetEspacoH(altura: 16),
        FilterPeriodeWidget(
          app: app,
          options: options,
          tedPeriodo: app.tedPeriodo,
        ),
        FilterCategoryWidget(
          app: app,
          options: options,
          tedCategoria: app.tedCategoria,
        ),
        // widgetfiltroclassificacao(
        //   app: app,
        //   options: options,
        //   tedClassificacao: app.tedClassificacao,
        // ),
        FilterAccessibilityWidget(
          app: app,
          options: options,
          tedAcessibilidade: app.tedAcessibilidade,
        ),
        FilterTicketWidget(
          app: app,
          options: options,
          tedIngresso: app.tedIngresso,
        ),
      ],
    );
  }
}
