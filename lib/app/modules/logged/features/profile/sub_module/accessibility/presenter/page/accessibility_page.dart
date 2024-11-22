import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/shared/button_default.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/core/data_preferences/data_preferences.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/accessibility/presenter/handler/accessibility_state_handler.dart';

class ProfileAccessibilityPage extends StatefulWidget {
  const ProfileAccessibilityPage({super.key});

  @override
  State<ProfileAccessibilityPage> createState() => _ProfileAccessibilityPageState();
}

class _ProfileAccessibilityPageState extends State<ProfileAccessibilityPage> {
  final AccessibilityPageStateHandler _handler = Modular.get();

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
        return PopScope(
          canPop: false,
          onPopInvoked: (_) => Modular.to.navigate(RouterApp.logged),
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const SizedBox(width: 8),
                  Semantics(
                    label: 'Voltar para a tela anterior',
                    child: GestureDetector(
                      onTap: () => Modular.to.navigate(RouterApp.logged),
                      child: SvgPicture.asset('imagens/icon_arrow_back.svg'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextContrastFont(
                    text: AppLocalizations.of(context)!.profile_accessibility,
                    style: TextStyle(
                      color: !_handler.store.statusAltoContraste ? Colors.black : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              backgroundColor: !_handler.store.statusAltoContraste ? Colors.white : Colors.black,
              surfaceTintColor: !_handler.store.statusAltoContraste ? Colors.white : Colors.black,
              elevation: 0,
              titleSpacing: 0,
              leadingWidth: 0,
              automaticallyImplyLeading: false,
            ),
            body: Container(
              color: _handler.store.statusAltoContraste ? Colors.black : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.profile_accessibility_resume,
                    style: const TextStyle(fontSize: 14, color: Color(0xff999999)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.int_first_subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: !_handler.store.statusAltoContraste ? Colors.black : Colors.white,
                        ),
                      ),
                      Semantics(
                        label:
                            _handler.store.statusAltoContraste ? 'Desativar alto contraste' : 'Ativar alto contraste',
                        child: widgetBotaoSwitch(
                          value: _handler.store.statusAltoContraste,
                          function: (value) => _handler.store.setStatusAltoContraste(value),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.int_first_explanation,
                    style: const TextStyle(fontSize: 14, color: Color(0xff999999)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.int_second_title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: !_handler.store.statusAltoContraste ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.int_second_example_title,
                    style: const TextStyle(fontSize: 14, color: Color(0xff999999)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.int_second_example_text,
                          semanticsLabel: AppLocalizations.of(context)!.int_second_example_text,
                          style: TextStyle(
                            fontSize: _handler.store.fontSize,
                            fontWeight: FontWeight.w400,
                            color: !_handler.store.statusAltoContraste ? Colors.black : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Semantics(
                        label: _handler.store.fontSize > 16
                            ? 'Diminuir fonte para ${_handler.store.fontSize - 2} pixels'
                            : 'Fonte no tamanho mínimo, impossível diminuir',
                        child: IconButton(
                          icon: const Icon(Icons.remove, size: 30, color: Colors.white),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(corBackgroundLaranja),
                            padding: const MaterialStatePropertyAll(EdgeInsets.all(2)),
                          ),
                          onPressed: () => onTapAlterFont(false),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.int_font_size} ${_handler.store.fontSize} px',
                            style: TextStyle(
                              fontSize: 14,
                              color: !_handler.store.statusAltoContraste ? Colors.black : Colors.white,
                            ),
                          )
                        ],
                      ),
                      Semantics(
                        label: _handler.store.fontSize < 24
                            ? 'Aumentar fonte para ${_handler.store.fontSize + 2} pixels'
                            : 'Fonte no tamanho máximo, impossível aumentar',
                        child: IconButton(
                          icon: const Icon(Icons.add, size: 30, color: Colors.white),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(corBackgroundLaranja),
                            padding: const MaterialStatePropertyAll(EdgeInsets.all(2)),
                          ),
                          onPressed: () => onTapAlterFont(true),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Semantics(
                    container: false,
                    label: "Botão Salvar",
                    child: ButtonDefault(
                      text: AppLocalizations.of(context)!.profile_accessibility_save,
                      function: () {
                        setFontSize(_handler.store.fontSize);
                        setAltoContraste(_handler.store.statusAltoContraste);
                        Modular.to.navigate(RouterApp.logged);
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onTapAlterFont(bool value) {
    if (value) {
      if (_handler.store.fontSize < 24) {
        _handler.store.fontSize = _handler.store.fontSize + 2;
      }
    } else {
      if (_handler.store.fontSize > 16) {
        _handler.store.fontSize = _handler.store.fontSize - 2;
      }
    }
  }

  void setFontSize(double fontSize) async {
    FontsApp.setTamanhoBase(fontSize.toInt());
    await Dados.setInt('tamanhofontebase', fontSize.toInt());
  }

  void setAltoContraste(bool isContrast) async {
    ColorsApp.setAltoContraste(isContrast);
    ColorsApp.reloadColors();
    await Dados.setBool('altocontraste', isContrast);
  }
}
