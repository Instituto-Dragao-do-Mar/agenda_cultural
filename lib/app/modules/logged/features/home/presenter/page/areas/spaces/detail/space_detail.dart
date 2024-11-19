import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/espacos/programacaoespaco.page.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_map.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_image.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_app_bar.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_more_info.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_evaluation.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_description.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_accessibility.dart';

class SpaceDetail extends StatelessWidget {
  final Space space;
  final Usuario user;

  const SpaceDetail({
    super.key,
    required this.space,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    void openNotificationError() {
      notifyPopUpWidget(context: context, textDescritivo: 'Erro ao abrir o link');
    }

    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: const SpaceDetailAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceDetailImageWidget(
                  urlImage: space.espacosimagens!.first.imagens!.first.url,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextContrasteFonte(
                        text: space.nome ?? 'Nome do Espaço',
                        style: GoogleFonts.inter(
                          fontSize: Fontes.tamanhoBase.toDouble(),
                          fontWeight: FontWeight.w600,
                          color: corTextAtual,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SpaceDetailDescriptionWidget(
                        description: space.detalhe ?? '',
                      ),
                      const SizedBox(height: 10),
                      SpaceDetailLocationWidget(
                        address: space.endereco != '' ? space.endereco ?? '' : 'Endereço não informado!',
                      ),
                      const SizedBox(height: 10),
                      SpaceDetailMapWidget(
                        space: space,
                      ),
                      const SizedBox(height: 10),
                      SpaceDetailAccessibilityWidget(
                        accessibility: space.acessibilidadeFisica ?? '',
                      ),
                      const SizedBox(height: 10),
                      SpaceDetailMoreInfoWidget(
                        onTap: () async {
                          try {
                            await launchUrlString('https://www.google.com.br');
                          } catch (e) {
                            openNotificationError();
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      SpaceDetailEvaluationWidget(
                        user: user,
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: widgetBotao(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              text: AppLocalizations.of(context)!.e_programming,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgramacaoEspacoPage(
                    espaco: space,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
