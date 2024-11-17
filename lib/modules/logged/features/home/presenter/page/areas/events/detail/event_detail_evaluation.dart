import 'package:agendacultural/model/evento_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetpopup.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/model/usuarioavaliacao_model.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/controller/usuarioavaliacao_controller.dart';
import 'package:agendacultural/shared/extensions/ex_compare_date_strings_in_days.dart';

class EventDetailEvaluationWidget extends StatefulWidget {
  final Evento evento;

  const EventDetailEvaluationWidget({
    super.key,
    required this.evento,
  });

  @override
  State<EventDetailEvaluationWidget> createState() => _EventDetailEvaluationWidgetState();
}

class _EventDetailEvaluationWidgetState extends State<EventDetailEvaluationWidget> {
  late AppModel app;
  int selecionado = 0;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontePadrao = Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14);

    if (!_isToday(widget.evento.eventosdatas!.first.datahora!)) {
      return const SizedBox();
    }

    return FutureBuilder<ListaUsuarioAvaliacao>(
      future: _getDataEvaluation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextContrasteFonte(
                text: AppLocalizations.of(context)!.e_evaluation,
                style: GoogleFonts.inter(
                  fontSize: fontePadrao.toDouble(),
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

        final lista = snapshot.data;
        if (lista?.usuariosavaliacoes?.isNotEmpty ?? false) {
          selecionado = lista!.usuariosavaliacoes!.first.avaliacao ?? 0;
        }

        return _buildEvaluationContent(context, size, fontePadrao);
      },
    );
  }

  /// Verifica se a data é hoje
  bool _isToday(String date) {
    return date.formatDate(format: 'yyyy-MM-dd') == DateTime.now().toIso8601String().formatDate(format: 'yyyy-MM-dd');
  }

  /// Constrói o conteúdo principal da avaliação
  Widget _buildEvaluationContent(BuildContext context, Size size, int fontePadrao) {
    final av1 = AppLocalizations.of(context)!.e_evaluation_one;
    final av2 = AppLocalizations.of(context)!.e_evaluation_two;
    final av3 = AppLocalizations.of(context)!.e_evaluation_three;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_evaluation,
          style: GoogleFonts.inter(
            fontSize: fontePadrao.toDouble(),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildEvaluationOption(size, 1, av1, 'liked', fontePadrao),
            _buildEvaluationOption(size, 2, av2, 'not_liked', fontePadrao),
            _buildEvaluationOption(size, 3, av3, 'closed_face', fontePadrao),
          ],
        ),
      ],
    );
  }

  /// Constrói uma opção de avaliação
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
            TextContrasteFonte(
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

  /// Obtém a URL do ícone
  String _getIconUrl(int value, String iconName) {
    if (selecionado == value) {
      return '${iconName}_orange.png';
    }
    return !Cores.contraste ? '${iconName}_black.png' : '${iconName}_white.png';
  }

  /// Confirma a avaliação
  void _confirmEvaluation(int value) async {
    if (app.usuarioLogado?.guidid == null) {
      _showLoginAlert();
      return;
    }

    final comentario = await _askForComment();

    if (comentario != null) {
      await _submitEvaluation(value, comentario);
    }
  }

  /// Mostra o alerta de login
  void _showLoginAlert() {
    notifyPopUpWidget(
      context: context,
      textDescritivo: AppLocalizations.of(context)!.e_alert_events,
      textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
      permitirFechar: true,
      funcaoBotao: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const pageLogin()),
        );
      },
    );
  }

  /// Pergunta pelo comentário
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
      funcaoBtnOk: () async {
        if (controller.text.isNotEmpty) {
          comentario = controller.text;
          return true;
        }
        return false;
      },
      titulo: AppLocalizations.of(context)!.e_alert_coments_title_two,
    );

    return comentario;
  }

  /// Envia a avaliação
  Future<void> _submitEvaluation(int value, String comentario) async {
    final controller = UsuarioAvaliacaoController();
    await controller.UsuarioAvaliacaoPost(
      userguidid: app.GetGuidId(),
      avaliacao: value.toString(),
      eventoguidid: widget.evento.guidid!,
      token: app.GetToken(),
      comentario: comentario,
    );
    setState(() {
      selecionado = value;
    });
  }

  /// Obtém os dados de avaliação
  Future<ListaUsuarioAvaliacao> _getDataEvaluation() async {
    if (app.usuarioLogado?.guidid == null) {
      return ListaUsuarioAvaliacao(usuariosavaliacoes: []);
    } else {
      final controller = UsuarioAvaliacaoController();
      return controller.UsuarioAvaliacaoGet(
        userguidid: app.GetGuidId(),
        eventoguidid: widget.evento.guidid!,
        token: app.GetToken(),
      );
    }
  }

  /// Exibe um widget de erro
  Widget _buildErrorWidget() {
    return const Text('Erro ao carregar avaliação do evento!');
  }
}
