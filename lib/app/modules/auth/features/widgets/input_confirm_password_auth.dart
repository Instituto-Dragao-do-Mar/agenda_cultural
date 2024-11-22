import 'package:flutter/material.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class InputConfirmPasswordAuthWidget extends StatelessWidget {
  final String label;
  final String valueConfirmPassword;
  final bool obscureText;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmitted;
  final void Function() setObscureText;

  const InputConfirmPasswordAuthWidget({
    super.key,
    required this.label,
    required this.valueConfirmPassword,
    required this.obscureText,
    required this.onChanged,
    this.onSubmitted,
    required this.setObscureText,
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
              style: TextStyle(
                color: corBackgroundLaranja,
                fontSize: FontsApp.tamanhoBase.toDouble(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Semantics(
          label: label,
          child: TextField(
            autofocus: false,
            obscureText: obscureText,
            style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
            onChanged: onChanged,
            onSubmitted: (_) => onSubmitted ?? FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              suffixIcon: valueConfirmPassword != ''
                  ? IconButton(
                      onPressed: setObscureText,
                      icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                    )
                  : null,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
