import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/filtro/pagefiltro.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/pages/home/event/item_event.dart';
import 'package:agendacultural/pages/schedule/item_list_dates.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/home/general/button_filter.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late AppModel app;

  TextEditingController tedInicio = TextEditingController(text: DateTime.now().toIso8601String());

  TextEditingController tedTermino = TextEditingController(
    text: DateTime.now().add(const Duration(days: 30)).toIso8601String(),
  );
  List<DateTime> listDates = [];
  DateTime dataSelecionada = DateTime.now().add(const Duration(days: -400));

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 8),
            child: Text(
              AppLocalizations.of(context)!.schedule_choice_data,
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: getDate(
                  ted: tedInicio,
                  titulo: AppLocalizations.of(context)!.schedule_choice_in,
                  primeiro: true,
                ),
              ),
              Expanded(
                flex: 1,
                child: getDate(
                  ted: tedTermino,
                  titulo: AppLocalizations.of(context)!.schedule_choice_until,
                  primeiro: false,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 8),
            child: Text(
              AppLocalizations.of(context)!.schedule_view_day,
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            ),
          ),
          const SizedBox(height: 5),
          _buildViewDaysFilter(),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 8),
              TextContrasteFonte(
                text: AppLocalizations.of(context)!.schedule_results,
                style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
              ),
              const Spacer(),
              const ButtonFilterWidget(),
            ],
          ),
          const SizedBox(height: 5),
          Wrap(
            children: app.listaEventos.eventos!.map(
              (e) {
                List<DateTime> datasEventos = app.getEventoDatas(e);

                List<DateTime> ldatasIntervalo = listDates = calculateDaysInterval(
                  DateTime.parse(tedInicio.text.substring(0, 10)),
                  DateTime.parse(tedTermino.text.substring(0, 10)),
                );

                if (!dataSelecionada.compareTo(DateTime.now().add(const Duration(days: -1))).isNegative) {
                  // Cai aqui se uma data for selecionada.

                  for (DateTime dia in datasEventos) {
                    if (dia.compareTo(dataSelecionada) == 0) {
                      return ItemEventWidget(evento: e);
                    }
                  }
                  return const SizedBox.shrink();
                }

                bool dentro = false;

                for (DateTime dia in datasEventos) {
                  if (ldatasIntervalo.any((element) => element.compareTo(dia) == 0)) {
                    dentro = true;
                  }
                }

                if (!dentro) {
                  return const SizedBox.shrink();
                }

                return ItemEventWidget(evento: e);
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  Widget _buildViewDaysFilter() {
    listDates = calculateDaysInterval(
      DateTime.parse(tedInicio.text.substring(0, 10)),
      DateTime.parse(tedTermino.text.substring(0, 10)),
    );

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        itemCount: listDates.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DateTime date = listDates[index];
          return GestureDetector(
            onTap: () {
              if (date == dataSelecionada) {
                dataSelecionada = DateTime.now().add(const Duration(days: -400));
                setState(() {});
              } else {
                dataSelecionada = date;
                setState(() {});
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 8, right: index == listDates.length - 1 ? 8 : 0),
              child: ItemListDatesWidget(
                data: date,
                selecionada: date == dataSelecionada,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getDate({
    required TextEditingController ted,
    required String titulo,
    required bool primeiro,
  }) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.tryParse(ted.text)!,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 180)),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFFE83C3B),
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          ted.text = pickedDate.toIso8601String();

          if (tedInicio.text.compareTo(tedTermino.text) > 0) {
            tedInicio.text = tedTermino.text;
          }

          setState(() {});
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(primeiro ? 10 : 0),
            bottomLeft: Radius.circular(primeiro ? 10 : 0),
            topRight: Radius.circular(!primeiro ? 10 : 0),
            bottomRight: Radius.circular(!primeiro ? 10 : 0),
          ),
          border: Border.all(
            color: Cores.contraste ? Colors.white : corBackgroundLaranja.withOpacity(.2),
          ),
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContrasteFonte(
              text: titulo,
              color: corBackgroundLaranja,
              weight: FontWeight.bold,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            ),
            const SizedBox(width: 5),
            TextContrasteFonte(
              text: ted.text.formatDate(format: "E, dd MMM"),
              color: corTextAtual,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleAppBarWidget extends StatelessWidget {
  final void Function()? notify;

  const ScheduleAppBarWidget({
    super.key,
    this.notify,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Semantics(
          label: 'Voltar para a tela anterior',
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'imagens/icon_arrow_back.svg',
            ),
          ),
        ),
        const SizedBox(width: 8),
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.schedule_title,
          style: TextStyle(
            color: corTextAtual,
            fontSize: Fontes.tamanhoBase.toDouble(),
          ),
        ),
        const Spacer(),
        Semantics(
          label: 'Ir para a tela de filtros',
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const pageFiltro(),
              ),
            ),
            child: SvgPicture.asset('imagens/icon_favorite.svg'),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
