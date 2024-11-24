import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/tradutors.dart';
import 'package:agendacultural/app/common/utils/capitalize.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';

class EventDetailCategories extends StatelessWidget {
  final Event event;
  final List<Category> categories;

  const EventDetailCategories({
    super.key,
    required this.event,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: _getListCategories(context),
      child: TextContrastFont(
        text: _getListCategories(context),
        style: GoogleFonts.inter(
          fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
          color: corBackgroundLaranja,
        ),
      ),
    );
  }

  String _getListCategories(BuildContext context) {
    // Obtém a categoria traduzida
    final label = AppLocalizations.of(context)!.e_category;

    // Mapeia as categorias do evento, aplica capitalização e remove máscaras
    final categoriesEvent = event.eventoscategorias!
        .map((e) => categories.firstWhere((element) => element.id == e.idcategoria).nome?.capitalize())
        .join(', ');

    // Aplica a remoção de máscaras
    final categoriesCleaned = _clearMaskWithSpaces(categoriesEvent);

    // Traduz as categorias e junta novamente
    final categoriesTranslated = categoriesCleaned.split(',').map((categoria) {
      return getNomeCategoria(categoria.trim(), context);
    }).join(', ');

    return '$label: $categoriesTranslated';
  }

  String _clearMaskWithSpaces(String text) {
    return text
        .replaceAll('-', '')
        .replaceAll('/', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('.', '');
  }
}
