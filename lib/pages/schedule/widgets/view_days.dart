import 'package:agendacultural/pages/schedule/widgets/item_view_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fontes.dart';

class ViewDaysWidget extends StatelessWidget {
  final List<DateTime> listDatesFilter;
  final DateTime dateSelected;
  final void Function(DateTime date) onTapDate;

  const ViewDaysWidget({
    super.key,
    required this.listDatesFilter,
    required this.dateSelected,
    required this.onTapDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 8),
          child: Text(
            AppLocalizations.of(context)!.schedule_view_day,
            style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
            itemCount: listDatesFilter.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DateTime date = listDatesFilter[index];
              return GestureDetector(
                onTap: () => onTapDate(date),
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: index == listDatesFilter.length - 1 ? 8 : 0),
                  child: ItemViewDaysWidget(
                    data: date,
                    selecionada: date == dateSelected,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
