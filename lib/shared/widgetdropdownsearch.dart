import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

Widget widgetDropdownSearch({
  String? hint,
  List<String>? itens,
  Function(String?)? funcao,
  String? valorInicial,
  Color? borderColor,
  width = double.infinity,
  mode = Mode.MENU,
  enable = true,
  String? Function(String?)? validator,
}) {
  //
  borderColor ??= corBackgroundLaranja;

  return Container(
    padding: EdgeInsets.zero,
    height: 50,
    width: width,
    /*decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.red),
      ),
    ),*/
    child: DropdownSearch<String>(
      //
      //mode: mode,
      //showSelectedItems: true,

      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),
      validator: validator,
      enabled: enable,

      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          label: hint == null ? null : Text(
            hint,
            /* style: TextStyle(
              color: funcao == null ? Colors.grey.withOpacity(.3) : Colors.grey,
            ) */
          ),
          alignLabelWithHint: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.4),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),

      //showSearchBox: enableSearch,

      //hint: "Selecione",
      items: itens!,
      selectedItem: valorInicial,
      onChanged: funcao,
    ),
  );
}
