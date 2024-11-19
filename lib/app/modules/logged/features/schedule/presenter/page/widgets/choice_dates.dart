import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/page/widgets/item_choice_dates.dart';

class ChoiceDatesWidget extends StatelessWidget {
  final void Function(TextEditingController, BuildContext) onTapDate;
  final TextEditingController initialController;
  final TextEditingController finalController;

  const ChoiceDatesWidget({
    super.key,
    required this.onTapDate,
    required this.initialController,
    required this.finalController,
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
          child: TextContrastFont(
            text: AppLocalizations.of(context)!.schedule_choice_data,
            weight: FontWeight.w600,
            semantics: AppLocalizations.of(context)!.schedule_choice_data,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const SizedBox(width: 8),
            _buildDateWidget(
              controller: initialController,
              label: AppLocalizations.of(context)!.schedule_choice_in,
              isInitialDate: true,
              context: context,
            ),
            _buildDateWidget(
              controller: finalController,
              label: AppLocalizations.of(context)!.schedule_choice_until,
              isInitialDate: false,
              context: context,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }

  Widget _buildDateWidget({
    required TextEditingController controller,
    required String label,
    required bool isInitialDate,
    required BuildContext context,
  }) {
    return Expanded(
      child: InsertDateWidget(
        onTapDate: () => onTapDate(controller, context),
        label: label,
        controller: controller,
        firstDate: isInitialDate,
      ),
    );
  }
}
