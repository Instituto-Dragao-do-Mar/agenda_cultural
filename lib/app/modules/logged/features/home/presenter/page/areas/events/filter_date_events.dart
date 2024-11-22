import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/filter_date.dart';

class FilterDateWidget extends StatelessWidget {
  final FilterDate filterDateSelected;
  final void Function(String value) onItemSelected;

  const FilterDateWidget({
    super.key,
    required this.filterDateSelected,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      decoration: null,
      items: [
        filterDateToString(context, FilterDate.thisWeek),
        filterDateToString(context, FilterDate.nextWeek),
        filterDateToString(context, FilterDate.nextMonth),
      ],
      itemBuilder: (String value) => Container(
        height: 40,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(value),
      ),
      onItemSelected: onItemSelected,
      child: SizedBox(
        width: 200,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: TextContrastFont(
                  semantics: filterDateToString(context, filterDateSelected),
                  text: filterDateToString(context, filterDateSelected),
                  color: corBackgroundLaranja,
                  weight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: corBackgroundLaranja,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
