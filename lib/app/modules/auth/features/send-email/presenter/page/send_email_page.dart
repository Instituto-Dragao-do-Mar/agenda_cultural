import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/features/send-email/presenter/page/widgets/send_email_app_bar.dart';
import 'package:agendacultural/app/modules/auth/features/send-email/presenter/handler/send_email_state_handler.dart';

class SendEmailPage extends StatefulWidget {
  const SendEmailPage({super.key});

  @override
  State<SendEmailPage> createState() => _SendEmailPageState();
}

class _SendEmailPageState extends State<SendEmailPage> {
  final SendEmailPageStateHandler _handler = Modular.get();

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
          appBar: const SendEmailAppBar(),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContrastFont(
                      text: AppLocalizations.of(context)!.login_reset_password_text,
                      semantics: AppLocalizations.of(context)!.login_reset_password_text,
                      maxlines: 3,
                      style: FontsApp.poppins12W400Grey((FontsApp.tamanhoBase + 2)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    TextContrastFont(
                      text: AppLocalizations.of(context)!.login_email,
                      semantics: AppLocalizations.of(context)!.login_email,
                      style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
                    ),
                    TextContrastFont(
                      text: ' *',
                      style: TextStyle(color: corBackgroundLaranja, fontSize: FontsApp.tamanhoBase.toDouble()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextField(
                  style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                  onChanged: (value) => _handler.store.setEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) async => await _handler.sendEmail(context, mounted),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
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
                const SizedBox(height: 50),
                Semantics(
                  label: AppLocalizations.of(context)!.login_reset_password_send,
                  child: ButtonDefault(
                    text: _handler.store.isLoading ? '...' : AppLocalizations.of(context)!.login_reset_password_send,
                    function: () async => _handler.store.isLoading ? () {} : await _handler.sendEmail(context, mounted),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
