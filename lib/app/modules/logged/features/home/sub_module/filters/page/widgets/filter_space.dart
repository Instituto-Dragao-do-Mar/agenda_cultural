import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class FilterSpaceWidget extends StatelessWidget {
  final List<String> options;
  final String? optionSelected;
  final void Function(String?) onChanged;

  const FilterSpaceWidget({
    super.key,
    required this.options,
    required this.optionSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.filter_spaces,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
        ),
        const SizedBox(height: 5),
        Container(
          padding: EdgeInsets.zero,
          width: double.infinity,
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                style: const TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            suffixProps: DropdownSuffixProps(
              clearButtonProps: ClearButtonProps(
                isVisible: true,
                icon: Icon(Icons.clear, color: Colors.black),
              ),
            ),
            decoratorProps: DropDownDecoratorProps(
              baseStyle: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: corBackgroundLaranja),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: corBackgroundLaranja),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: corBackgroundLaranja),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: AppLocalizations.of(context)!.filter_sel_space,
                hintStyle: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                contentPadding: const EdgeInsets.all(8),
              ),
            ),
            items: (c, v) => options,
            selectedItem: optionSelected,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
