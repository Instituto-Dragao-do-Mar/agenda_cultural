import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_map.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_image.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_app_bar.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_more_info.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/programming/programming_space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_evaluation.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_description.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/detail/space_detail_accessibility.dart';

class SpaceDetail extends StatelessWidget {
  final Space space;
  final List<Event> events;
  final List<Space> spaces;
  final List<Category> categories;
  final List<Favorite> favorites;
  final User user;
  final List<Event> eventsProgramming;
  final void Function(bool isDetail) onConcludeFavorite;

  const SpaceDetail({
    super.key,
    required this.space,
    required this.spaces,
    required this.events,
    required this.categories,
    required this.favorites,
    required this.user,
    required this.eventsProgramming,
    required this.onConcludeFavorite,
  });

  @override
  Widget build(BuildContext context) {
    void openNotificationError() {
      notifyPopUpWidget(context: context, description: 'Erro ao abrir o link');
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
                      TextContrastFont(
                        text: space.nome ?? 'Nome do Espaço',
                        style: GoogleFonts.inter(
                          fontSize: FontsApp.tamanhoBase.toDouble(),
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
                        user: user,
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
                        space: space,
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
            child: ButtonDefault(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              text: AppLocalizations.of(context)!.e_programming,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgrammingSpace(
                    space: space,
                    spaces: spaces,
                    events: eventsProgramming,
                    categories: categories,
                    favorites: favorites,
                    user: user,
                    onConcludeFavorite: onConcludeFavorite,
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
