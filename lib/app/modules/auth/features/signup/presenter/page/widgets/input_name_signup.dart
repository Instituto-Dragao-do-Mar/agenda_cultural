import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class InputNameSignupWidget extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;

  const InputNameSignupWidget({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextContrastFont(
              text: label,
              semantics: label,
              style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
            ),
            TextContrastFont(
              text: ' *',
              style: TextStyle(color: corBackgroundLaranja, fontSize: FontsApp.tamanhoBase.toDouble()),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Semantics(
          label: label,
          child: TextField(
            style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              focusColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
