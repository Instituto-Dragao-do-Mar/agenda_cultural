import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/colors.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';

class SpaceDetailEvaluationWidget extends StatefulWidget {
  final User user;

  const SpaceDetailEvaluationWidget({
    super.key,
    required this.user,
  });

  @override
  State<SpaceDetailEvaluationWidget> createState() => _SpaceDetailEvaluationWidgetState();
}

class _SpaceDetailEvaluationWidgetState extends State<SpaceDetailEvaluationWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final av1 = AppLocalizations.of(context)!.e_evaluation_one;
    final av2 = AppLocalizations.of(context)!.e_evaluation_two;
    final av3 = AppLocalizations.of(context)!.e_evaluation_three_e;
    final size = MediaQuery.of(context).size;
    final font = FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrastFont(
          text: AppLocalizations.of(context)!.e_evaluation_e,
          style: GoogleFonts.inter(
            fontSize: font.toDouble(),
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildEvaluationOption(size, 1, av1, 'liked', font),
            _buildEvaluationOption(size, 2, av2, 'not_liked', font),
            _buildEvaluationOption(size, 3, av3, 'closed_face', font),
          ],
        ),
      ],
    );
  }

  // Constrói uma opção de avaliação
  Widget _buildEvaluationOption(Size size, int value, String label, String iconName, int fontePadrao) {
    return SizedBox(
      width: size.width * 0.3,
      child: GestureDetector(
        onTap: () async => _confirmEvaluation(value),
        child: Column(
          children: [
            widgetImagemInterna(
              imagem: Imagem(url: _getIconUrl(value, iconName)),
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            TextContrastFont(
              text: label,
              style: GoogleFonts.inter(
                fontSize: fontePadrao.toDouble(),
                fontWeight: FontWeight.w500,
                color: corTextAtual,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Obtém a URL do ícone
  String _getIconUrl(int value, String iconName) {
    if (selected == value) {
      return '${iconName}_orange.png';
    }
    return !ColorsApp.contraste ? '${iconName}_black.png' : '${iconName}_white.png';
  }

  void _confirmEvaluation(int value) {
    if (widget.user.guidid == null) {
      _showLoginAlert();
      return;
    }

    setState(() => selected = (value != 0 && selected != value) ? value : 0);
  }

  // Mostra o alerta de login
  void _showLoginAlert() {
    notifyPopUpWidget(
      context: context,
      textDescritivo: AppLocalizations.of(context)!.e_alert_spaces,
      textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
      permitirFechar: true,
      funcaoBotao: () => Modular.to.navigate(RouterApp.auth),
    );
  }
}
