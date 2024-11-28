import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
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
    final List<String> items = [
      filterDateToString(context, FilterDate.thisWeek),
      filterDateToString(context, FilterDate.nextWeek),
      filterDateToString(context, FilterDate.nextMonth),
    ];

    return Container(
      width: 200,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: corBackgroundLaranja),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: filterDateToString(context, filterDateSelected),
          icon: Icon(
            Icons.arrow_drop_down,
            color: corBackgroundLaranja,
            size: 22,
          ),
          isExpanded: true,
          style: TextStyle(
            color: corBackgroundLaranja,
            fontWeight: FontWeight.w600,
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: TextContrastFont(
                semantics: value,
                text: value,
                color: corText,
                weight: FontWeight.w600,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onItemSelected(newValue);
            }
          },
        ),
      ),
    );
  }
}
