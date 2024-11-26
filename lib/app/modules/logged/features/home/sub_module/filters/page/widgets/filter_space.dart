import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';

class FilterSpaceWidget extends StatefulWidget {
  const FilterSpaceWidget({
    super.key,
    required this.tedEspaco,
    required this.espacos,
  });

  final TextEditingController tedEspaco;
  final List<Space> espacos;

  @override
  State<FilterSpaceWidget> createState() => _FilterSpaceWidgetState();
}

class _FilterSpaceWidgetState extends State<FilterSpaceWidget> {
  late List<String> opcoes;

  @override
  void initState() {
    super.initState();
    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = [];
    for (Space e in widget.espacos) {
      if (!opcoes.any((element) => element == e.nome)) {
        opcoes.add(e.nome!);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            clearButtonProps: const ClearButtonProps(
              isVisible: true,
              icon: Icon(Icons.clear, color: Colors.black),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: const TextStyle(color: Colors.black),
              dropdownSearchDecoration: InputDecoration(
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
                hintStyle: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                contentPadding: const EdgeInsets.all(8),
              ),
            ),
            items: opcoes,
            onChanged: (s) {},
          ),
        )
      ],
    );
  }
}
