import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/area_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filter_space.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filters_ticket.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filters_periode.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filters_app_bar.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filters_category.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/handler/filters_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filters_accessibility.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/filters/page/widgets/filters_classification.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final FiltersPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: corBgAtual,
          appBar: const FiltersAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _handler.store.scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.e_location,
                          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                        ),
                        AreaLocationWidget(
                          onTapNavigateLocation: () => Modular.to.pushNamed(RouterApp.logged + RouterApp.myLocation),
                        ),
                        const SizedBox(height: 10),
                        FilterSpaceWidget(
                          options: _handler.store.optionsSpaces,
                          optionSelected: _handler.appStore.optionSelectedSpace != ''
                              ? _handler.appStore.optionSelectedSpace
                              : null,
                          onChanged: (value) => _handler.appStore.setOptionSelectedSpace(value ?? ''),
                        ),
                        const SizedBox(height: 10),
                        FiltersPeriodeWidget(
                          optionsComponent: _options,
                          options: const ['Hoje', 'Amanhã', 'Essa Semana', 'Próxima Semana', 'Próximo Mês'],
                          controllerGroupPeriode: _handler.store.controllerGroupPeriode,
                          onSelected: (string, index, isSelected) {
                            if (string == _handler.appStore.optionSelectedPeriode) {
                              _handler.appStore.setOptionSelectedPeriode('');
                              _handler.store.controllerGroupPeriode.unselectAll();
                            } else {
                              _handler.appStore.setOptionSelectedPeriode(string);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        FiltersCategoryWidget(
                          optionsComponent: _options,
                          options: _handler.store.optionsCategories,
                          controllerGroupCategory: _handler.store.controllerGroupCategory,
                          onSelected: (string, index, isSelected) {
                            if (string == 'Ver mais') {
                              _handler.store.setIsExpandedCategory(true);
                              _handler.store.setOptionsCategories(
                                [..._handler.appStore.categories.map((e) => e.nome ?? '').toList(), 'Ver menos'],
                              );
                              _handler.store.controllerGroupCategory.unselectAll();
                            } else if (string == 'Ver menos') {
                              _handler.store.setIsExpandedCategory(false);
                              _handler.store.setOptionsCategories(
                                [..._handler.appStore.categories.map((e) => e.nome ?? '').toList().take(4), 'Ver mais'],
                              );
                              _handler.store.controllerGroupCategory.unselectAll();
                            } else if (string == _handler.appStore.optionSelectedCategory) {
                              _handler.appStore.setOptionSelectedCategory('');
                              _handler.store.controllerGroupCategory.unselectAll();
                            } else {
                              _handler.appStore.setOptionSelectedCategory(string);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        FiltersClassificationWidget(
                          optionsComponent: _options,
                          options: _handler.store.optionsClassification,
                          controllerGroupPeriode: _handler.store.controllerGroupClassification,
                          onSelected: (string, index, isSelected) {
                            if (string == _handler.appStore.optionSelectedClassification) {
                              _handler.appStore.setOptionSelectedClassification('');
                              _handler.store.controllerGroupClassification.unselectAll();
                            } else {
                              _handler.appStore.setOptionSelectedClassification(string);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        FiltersAccessibilityWidget(
                          optionsComponent: _options,
                          options: _handler.store.optionsAccessibility,
                          controllerGroupAccessibility: _handler.store.controllerGroupAccessibility,
                          onSelected: (string, index, isSelected) {
                            final allAccessibilityOptions = <String>{};
                            for (Space space in _handler.appStore.spaces) {
                              if (space.acessibilidadeFisica != null && space.acessibilidadeFisica!.isNotEmpty) {
                                allAccessibilityOptions.addAll(space.acessibilidadeFisica!.split(';'));
                              }
                            }

                            if (string == 'Ver mais') {
                              _handler.store.setIsExpandedAccessibility(true);
                              _handler.store.setOptionsAccessibility([...allAccessibilityOptions, 'Ver menos']);
                              _handler.store.controllerGroupAccessibility.unselectAll();
                            } else if (string == 'Ver menos') {
                              _handler.store.setIsExpandedAccessibility(false);
                              _handler.store.setOptionsAccessibility([...allAccessibilityOptions.take(4), 'Ver mais']);
                              _handler.store.controllerGroupAccessibility.unselectAll();
                            } else if (string == _handler.appStore.optionSelectedAccessibility) {
                              _handler.appStore.setOptionSelectedAccessibility('');
                              _handler.store.controllerGroupAccessibility.unselectAll();
                            } else {
                              _handler.appStore.setOptionSelectedAccessibility(string);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        FiltersTicketWidget(
                          optionsComponent: _options,
                          controllerGroupTicket: _handler.store.controllerGroupTicket,
                          options: const ['Todos', 'Gratuito', 'Pago'],
                          onSelected: (string, index, isSelected) {
                            if (string == _handler.appStore.optionSelectedTicket) {
                              _handler.appStore.setOptionSelectedTicket('');
                              _handler.store.controllerGroupTicket.unselectAll();
                            } else {
                              _handler.appStore.setOptionSelectedTicket(string);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handler.apllyFilter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corBackgroundLaranja,
                      surfaceTintColor: corBackgroundLaranja,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.profile_accessibility_save,
                      semanticsLabel: AppLocalizations.of(context)!.profile_accessibility_save,
                      style: GoogleFonts.roboto(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  final GroupButtonOptions _options = GroupButtonOptions(
    selectedShadow: const [],
    selectedTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
    selectedColor: corBackgroundLaranja,
    selectedBorderColor: corBackgroundLaranja,
    unselectedShadow: const [],
    unselectedColor: Colors.white,
    unselectedTextStyle: TextStyle(fontSize: 12, color: Colors.amber[900]),
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
}
