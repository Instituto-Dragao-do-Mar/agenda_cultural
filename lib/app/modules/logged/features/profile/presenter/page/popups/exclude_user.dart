import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/store/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ExcludeUserPopUp extends StatefulWidget {
  final ProfileStore store;
  final VoidCallback onTapConfirm;

  const ExcludeUserPopUp({
    super.key,
    required this.store,
    required this.onTapConfirm,
  });

  @override
  State<ExcludeUserPopUp> createState() => _ExcludeUserPopUpState();
}

class _ExcludeUserPopUpState extends State<ExcludeUserPopUp> {
  @override
  void dispose() {
    widget.store.setEmail('');
    widget.store.setIsLoading(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: IntrinsicHeight(
            child: Column(
              spacing: 20,
              children: [
                Text(
                  'Digite seu e-mail para confirmar a exclusão da conta',
                  semanticsLabel: 'Digite seu e-mail para confirmar a exclusão da conta!',
                  style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                ),
                Semantics(
                  label: 'Campo de e-mail',
                  child: TextField(
                    style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                    onChanged: widget.store.setEmail,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.black,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancelar',
                        semanticsLabel: 'Cancelar',
                        style: TextStyle(
                          fontSize: FontsApp.tamanhoBase.toDouble() - 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: widget.onTapConfirm,
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.white,
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFEA5B0C),
                        side: BorderSide(color: const Color(0xFFEA5B0C)),
                      ),
                      child: widget.store.isLoading
                          ? Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.symmetric(horizontal: 26),
                              child: CircularProgressIndicator(
                                color: const Color(0xFFEA5B0C),
                              ),
                            )
                          : Text(
                              'Confirmar',
                              semanticsLabel: 'Confirmar',
                              style: TextStyle(
                                fontSize: FontsApp.tamanhoBase.toDouble() - 2,
                                color: const Color(0xFFEA5B0C),
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
