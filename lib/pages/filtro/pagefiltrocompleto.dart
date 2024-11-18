import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroacessibilidade.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltrocategoria.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroingresso.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroperiodo.dart';
import 'package:agendacultural/pages/home/location/area_location.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/presenter/page/my_location_page.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbottombotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltroCompletoPage extends StatefulWidget {
  const FiltroCompletoPage({super.key});

  @override
  State<FiltroCompletoPage> createState() => _FiltroCompletoPageState();
}

class _FiltroCompletoPageState extends State<FiltroCompletoPage> {
  late AppModel app;
  int? fonte;
  bool? contraste = false;

  GroupButtonOptions options = GroupButtonOptions(
    selectedShadow: const [],
    selectedTextStyle: const TextStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    selectedColor: corBackgroundLaranja,
    unselectedShadow: const [],
    unselectedColor: corBackgroundNegative,
    unselectedTextStyle: TextStyle(
      fontSize: 12,
      color: Colors.amber[900],
    ),
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
            widgetTopoComum(
              text: AppLocalizations.of(context)!.home_filter,
              funcaoImagem1: () async {
                Navigator.pop(context);
              },
              urlImagem1: 'seta.png',
            ),
            const widgetEspacoH(altura: 16),
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
            const widgetEspacoH(altura: 16),
            widgetBottomBotao(
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
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        AreaLocationWidget(
          onTapNavigateLocation: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyLocationPage()),
          ),
        ),
        const widgetEspacoH(altura: 16),
        // widgetfiltroespaco(
        //   app: app,
        //   options: options,
        //   tedEspaco: app.tedEspaco,
        // ),
        // const widgetEspacoH(altura: 16),
        widgetfiltroperiodo(
          app: app,
          options: options,
          tedPeriodo: app.tedPeriodo,
        ),
        FiltroCategoriaWidget(
          app: app,
          options: options,
          tedCategoria: app.tedCategoria,
        ),
        // widgetfiltroclassificacao(
        //   app: app,
        //   options: options,
        //   tedClassificacao: app.tedClassificacao,
        // ),
        FiltroAcessibilidadeWidget(
          app: app,
          options: options,
          tedAcessibilidade: app.tedAcessibilidade,
        ),
        widgetfiltroingresso(
          app: app,
          options: options,
          tedIngresso: app.tedIngresso,
        ),
      ],
    );
  }
}
