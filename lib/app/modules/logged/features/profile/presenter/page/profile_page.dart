import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/presenter/page/auth_page.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/page/widgets/option_profile.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/handler/profile_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/page/widgets/pages/profile_info.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/page/widgets/pages/profile_about.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfilePageStateHandler _handler = Modular.get();

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
    return Scaffold(
      backgroundColor: corBgAtual,
      body: Container(
        color: corBgAtual,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção: Conta
            _buildSectionTitle(
              AppLocalizations.of(context)!.profile_account,
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_account_data,
              onTap: () async {
                if (_handler.appStore.userLogged.guidid == null) {
                  notifyPopUpWidget(
                    context: context,
                    permitirFechar: true,
                    textDescritivo: AppLocalizations.of(context)!.profile_account_data_alert,
                    textBotao: AppLocalizations.of(context)!.profile_account_data_alert_accept,
                    funcaoBotao: () => Modular.to.navigate(RouterApp.auth),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileInfo(
                        nameUser: _handler.appStore.userLogged.nome ?? '',
                        emailUser: _handler.appStore.userLogged.email ?? '',
                      ),
                    ),
                  );
                }
              },
            ),

            // Seção: Geral
            const SizedBox(height: 20),
            _buildSectionTitle(
              AppLocalizations.of(context)!.profile_general,
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_general_terms,
              onTap: () => notifyPopUpWidget(
                context: context,
                permitirFechar: true,
                textDescritivo: AppLocalizations.of(context)!.profile_general_alert,
                textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                funcaoBotao: () => _openLink('https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos'),
              ),
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_general_help,
              onTap: () => notifyPopUpWidget(
                context: context,
                permitirFechar: true,
                textDescritivo: AppLocalizations.of(context)!.profile_general_alert,
                textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                funcaoBotao: () => _openLink('https://grupo-manual.gitbook.io/app-cultura.ce/ajuda'),
              ),
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_general_upon,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileAbout(),
                ),
              ),
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_general_evaluate,
              onTap: () => notifyPopUpWidget(
                context: context,
                permitirFechar: true,
                textDescritivo: AppLocalizations.of(context)!.profile_general_alert,
                textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                funcaoBotao: () => _openLink('https://forms.gle/xzducZWvrhDsWeKt6'),
              ),
            ),

            // Seção: Acessibilidade
            const SizedBox(height: 20),
            _buildSectionTitle(
              AppLocalizations.of(context)!.profile_accessibility,
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_accessibility_resources,
              onTap: () => Modular.to.navigate(RouterApp.logged + RouterApp.accessibility),
            ),
            _buildOption(
              subtitle: AppLocalizations.of(context)!.profile_language,
              onTap: () => Modular.to.navigate(RouterApp.logged + RouterApp.language),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openLink(String url) async {
    try {
      await launchUrlString(url);
    } catch (e) {
      _showNotificationError();
    }
  }

  void _showNotificationError() {
    notifyPopUpWidget(context: context, textDescritivo: 'Erro ao abrir o link');
  }

  Widget _buildSectionTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrastFont(
          text: text,
          weight: FontWeight.w600,
          semantics: text,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildOption({required String subtitle, required VoidCallback onTap}) {
    return Column(
      children: [
        OptionProfileWidget(
          subtitle: subtitle,
          onTap: onTap,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
