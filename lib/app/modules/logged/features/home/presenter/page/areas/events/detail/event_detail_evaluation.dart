import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/widgets/edit_popup.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/adapter/user_evaluation.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/controller/user_evaluation_controller.dart';

class EventDetailEvaluationWidget extends StatefulWidget {
  final Event event;
  final User user;

  const EventDetailEvaluationWidget({
    super.key,
    required this.event,
    required this.user,
  });

  @override
  State<EventDetailEvaluationWidget> createState() => _EventDetailEvaluationWidgetState();
}

class _EventDetailEvaluationWidgetState extends State<EventDetailEvaluationWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final av1 = AppLocalizations.of(context)!.e_evaluation_one;
    final av2 = AppLocalizations.of(context)!.e_evaluation_two;
    final av3 = AppLocalizations.of(context)!.e_evaluation_three;
    final size = MediaQuery.of(context).size;
    final font = FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14);

    if (!_isToday(widget.event.eventosdatas?.first.datahora ?? '')) {
      return const SizedBox();
    }

    return FutureBuilder(
      future: _getDataEvaluation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextContrastFont(
                text: AppLocalizations.of(context)!.e_evaluation,
                style: GoogleFonts.inter(
                  fontSize: font.toDouble(),
                  fontWeight: FontWeight.w600,
                  color: corTextAtual,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: corBackgroundLaranja),
                  ],
                ),
              ),
            ],
          );
        }

        if (snapshot.hasError) {
          return _buildErrorWidget();
        }

        final list = snapshot.data;
        if (list?.isNotEmpty ?? false) {
          selected = list?.first.avaliacao ?? 0;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextContrastFont(
              text: AppLocalizations.of(context)!.e_evaluation,
              style: GoogleFonts.inter(
                fontSize: font.toDouble(),
                fontWeight: FontWeight.w600,
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
      },
    );
  }

  // Verifica se a data é hoje
  bool _isToday(String date) {
    return _formatDate('yyyy-MM-dd', date) == _formatDate('yyyy-MM-dd', DateTime.now().toIso8601String());
  }

  // Constrói uma opção de avaliação
  Widget _buildEvaluationOption(Size size, int value, String label, String iconName, int fontePadrao) {
    return SizedBox(
      width: size.width * 0.3,
      child: GestureDetector(
        onTap: () async => _confirmEvaluation(value),
        child: Column(
          children: [
            Image.asset(
              'imagens/${_getIconUrl(value, iconName)}',
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

  // Confirma a avaliação
  void _confirmEvaluation(int value) async {
    if (widget.user.guidid == null) {
      _showLoginAlert();
      return;
    }

    final comentario = await _askForComment();

    await _submitEvaluation(value, comentario ?? '');
  }

  // Mostra o alerta de login
  void _showLoginAlert() {
    notifyPopUpWidget(
      context: context,
      description: AppLocalizations.of(context)!.e_alert_events,
      labelButton: AppLocalizations.of(context)!.profile_general_alert_accept,
      enablePop: true,
      functionButton: () => Modular.to.navigate(RouterApp.auth),
    );
  }

  // Pergunta pelo comentário
  Future<String?> _askForComment() async {
    final controller = TextEditingController();
    String? comentario;

    await showFuturePopupDialog(
      context: context,
      edits: [
        EditPopup(
          edit: controller,
          funcao: (v) {},
          tipo: EditPopupType.texto,
          titulo: AppLocalizations.of(context)!.e_alert_coments_title,
        ),
      ],
      functionButton: () async {
        if (controller.text.isNotEmpty) {
          comentario = controller.text;
          return true;
        }
        return true;
      },
      label: AppLocalizations.of(context)!.e_alert_coments_title_two,
    );

    return comentario;
  }

  // Envia a avaliação
  Future<void> _submitEvaluation(int value, String comentario) async {
    UsuarioAvaliacaoController usuarioAvaliacaoController = UsuarioAvaliacaoController();
    LogController logController = LogController();

    await usuarioAvaliacaoController.postUserEvaluation(
      userGuidId: widget.user.guidid ?? '',
      evaluation: value.toString(),
      eventGuidId: widget.event.guidid ?? '',
      spaceGuidId: widget.event.eventosdatas?.first.idespaco.toString() ?? '',
      token: widget.user.signature ?? '',
      coment: comentario,
    );

    if (value != 0) {
      logController.postLog(
        idLogTipo: 5,
        guidUsuario: widget.user.guidid ?? '',
        observacao: 'Usuário ${widget.user.guidid != null ? '${widget.user.nome}' : 'não identificado'} '
            'avaliou o evento ${widget.event.id} '
            '(${value == 1 ? 'gostou' : value == 2 ? 'não gostou' : 'indiferente'})',
      );
    } else {
      logController.postLog(
        idLogTipo: 5,
        guidUsuario: widget.user.guidid ?? '',
        observacao: 'Usuário ${widget.user.guidid != null ? '${widget.user.nome}' : 'não identificado'} '
            'cancelou a avaliação do evento ${widget.event.id}',
      );
    }

    if (comentario.isNotEmpty) {
      logController.postLog(
        idLogTipo: 11,
        guidUsuario: widget.user.guidid ?? '',
        observacao: 'Usuário ${widget.user.guidid != null ? '${widget.user.nome}' : 'não identificado'} '
            'comentou o evento ${widget.event.id}',
      );
    }

    setState(() {
      selected = value;
    });
  }

  // Obtém os dados de avaliação
  Future<List<UserEvaluation>> _getDataEvaluation() async {
    await Future.delayed(const Duration(seconds: 1));

    if (widget.user.guidid == null) {
      return [];
    } else {
      final controller = UsuarioAvaliacaoController();
      return controller.getUserEvaluation(
        userGuidId: widget.user.guidid ?? '',
        eventGuidId: widget.event.guidid ?? '',
        token: widget.user.signature ?? '',
      );
    }
  }

  // Exibe um widget de erro
  Widget _buildErrorWidget() {
    return const Text('Erro ao carregar avaliação do evento!');
  }

  String _formatDate(String format, String date) {
    if (format.isEmpty || date.isEmpty) return '';

    final dateFormat = DateFormat(format, 'pt_BR');

    return dateFormat.format(DateTime.parse(date));
  }
}
