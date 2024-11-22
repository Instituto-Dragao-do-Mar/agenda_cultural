import 'package:flutter/material.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';

class InputPasswordSignupWidget extends StatelessWidget {
  final String label;
  final String valuePassword;
  final bool obscureText;
  final void Function(String value) onChanged;
  final void Function() onSetObscureText;

  const InputPasswordSignupWidget({
    super.key,
    required this.label,
    required this.valuePassword,
    required this.obscureText,
    required this.onChanged,
    required this.onSetObscureText,
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
            obscureText: obscureText,
            style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              suffixIcon: valuePassword != ''
                  ? Semantics(
                      label: obscureText ? 'Clique para mostrar a senha' : 'Clique para ocultar a senha',
                      child: IconButton(
                        onPressed: onSetObscureText,
                        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                      ),
                    )
                  : null,
              focusColor: Colors.black,
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
