import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/pages/schedule/widgets/item_choice_dates.dart';

class ChoiceDatesWidget extends StatelessWidget {
  final Future<void> Function(TextEditingController) onTapDate;
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
          child: Text(
            AppLocalizations.of(context)!.schedule_choice_data,
            style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 8),
            _buildDateWidget(
              controller: initialController,
              label: AppLocalizations.of(context)!.schedule_choice_in,
              isInitialDate: true,
            ),
            _buildDateWidget(
              controller: finalController,
              label: AppLocalizations.of(context)!.schedule_choice_until,
              isInitialDate: false,
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
  }) {
    return Expanded(
      child: InsertDateWidget(
        onTapDate: () => onTapDate(controller),
        label: label,
        controller: controller,
        firstDate: isInitialDate,
      ),
    );
  }
}
