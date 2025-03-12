import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/tradutors.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/categories/item_category_filter.dart';

class AreaCategoryWidget extends StatelessWidget {
  final ScrollController scrollControllerCategories;
  final List<Category> categories;
  final bool showAllCategories;
  final Category? selectedCategory;
  final void Function() onTapExpandCategories;
  final void Function(Category categoria) applyFilterCategory;

  const AreaCategoryWidget({
    super.key,
    required this.scrollControllerCategories,
    required this.categories,
    required this.showAllCategories,
    required this.selectedCategory,
    required this.onTapExpandCategories,
    required this.applyFilterCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        HeaderCardsWidget(
          title: AppLocalizations.of(context)!.home_categories,
          subtitle: showAllCategories
              ? AppLocalizations.of(context)!.home_categories_less
              : AppLocalizations.of(context)!.home_categories_all,
          onTap: onTapExpandCategories,
        ),
        const SizedBox(height: 10),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInQuad,
          child: SizedBox(
            width: double.infinity,
            height: showAllCategories ? null : 130,
            child: SingleChildScrollView(
              physics: showAllCategories ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
              controller: scrollControllerCategories,
              scrollDirection: showAllCategories ? Axis.vertical : Axis.horizontal,
              child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: categories.map(
                  (categoryComponent) {
                    if (categoryComponent.imagens == null || categoryComponent.imagens!.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Padding(
                      padding: !showAllCategories
                          ? categoryComponent == categories.first
                              ? const EdgeInsets.symmetric(horizontal: 8)
                              : const EdgeInsets.only(right: 8)
                          : const EdgeInsets.symmetric(horizontal: 8),
                      child: ItemCategoryFilterWidget(
                        category: categoryComponent,
                        nameCategory: getNomeCategoria(categoryComponent.nome ?? '', context),
                        isSelected: selectedCategory == categoryComponent,
                        applyFilterCategory: () => applyFilterCategory(categoryComponent),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
