import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt')
  ];

  /// No description provided for @int_button_forward.
  ///
  /// In pt, this message translates to:
  /// **'Avançar'**
  String get int_button_forward;

  /// No description provided for @int_title.
  ///
  /// In pt, this message translates to:
  /// **'Qual é o seu idioma?'**
  String get int_title;

  /// No description provided for @int_title_accessibility.
  ///
  /// In pt, this message translates to:
  /// **'Ajustar os recursos de acessibilidade'**
  String get int_title_accessibility;

  /// No description provided for @int_first_subtitle.
  ///
  /// In pt, this message translates to:
  /// **'Alto contraste'**
  String get int_first_subtitle;

  /// No description provided for @int_first_explanation.
  ///
  /// In pt, this message translates to:
  /// **'O modo de alto contraste permite ao usuário inverter as cores do primeiro plano e do plano de fundo, o que geralmente ajuda o texto a se destacar'**
  String get int_first_explanation;

  /// No description provided for @int_second_title.
  ///
  /// In pt, this message translates to:
  /// **'Aumento da fonte'**
  String get int_second_title;

  /// No description provided for @int_second_example_title.
  ///
  /// In pt, this message translates to:
  /// **'Texto de exemplo'**
  String get int_second_example_title;

  /// No description provided for @int_second_example_text.
  ///
  /// In pt, this message translates to:
  /// **'Mas a terra de Oz nunca foi civilizada, porque vivemos separados do resto do mundo.'**
  String get int_second_example_text;

  /// No description provided for @int_font_size.
  ///
  /// In pt, this message translates to:
  /// **'Tamanho da fonte:'**
  String get int_font_size;

  /// No description provided for @int_text_presentation.
  ///
  /// In pt, this message translates to:
  /// **'Com o aplicativo cultura.ce você tem acesso à toda a programação da Rede Pública de Equipamentos Culturais da Secult Ceará num só lugar!'**
  String get int_text_presentation;

  /// No description provided for @int_button_enter.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get int_button_enter;

  /// No description provided for @int_cookies_title.
  ///
  /// In pt, this message translates to:
  /// **'Huum... utilizamos cookies'**
  String get int_cookies_title;

  /// No description provided for @int_cookies_subtitle.
  ///
  /// In pt, this message translates to:
  /// **'Nós armazenamos dados temporariamente para melhorar a sua experiência de navegação e recomendar conteúdo de seu interesse. Ao recusar pode impossibilitar a utilização de alguns dos recursos.'**
  String get int_cookies_subtitle;

  /// No description provided for @int_cookies_button_decline.
  ///
  /// In pt, this message translates to:
  /// **'Recusar'**
  String get int_cookies_button_decline;

  /// No description provided for @int_cookies_button_accept.
  ///
  /// In pt, this message translates to:
  /// **'Aceitar'**
  String get int_cookies_button_accept;

  /// No description provided for @int_card_page_number.
  ///
  /// In pt, this message translates to:
  /// **'de'**
  String get int_card_page_number;

  /// No description provided for @nav_bar_home.
  ///
  /// In pt, this message translates to:
  /// **'Início'**
  String get nav_bar_home;

  /// No description provided for @nav_bar_schedule.
  ///
  /// In pt, this message translates to:
  /// **'Agenda'**
  String get nav_bar_schedule;

  /// No description provided for @nav_bar_map.
  ///
  /// In pt, this message translates to:
  /// **'Mapa'**
  String get nav_bar_map;

  /// No description provided for @nav_bar_favorites.
  ///
  /// In pt, this message translates to:
  /// **'Favoritos'**
  String get nav_bar_favorites;

  /// No description provided for @nav_bar_profile.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get nav_bar_profile;

  /// No description provided for @home_location.
  ///
  /// In pt, this message translates to:
  /// **'Minha Localização'**
  String get home_location;

  /// No description provided for @home_categories.
  ///
  /// In pt, this message translates to:
  /// **'Categorias'**
  String get home_categories;

  /// No description provided for @home_categories_all.
  ///
  /// In pt, this message translates to:
  /// **'Ver todas as categorias'**
  String get home_categories_all;

  /// No description provided for @home_categories_less.
  ///
  /// In pt, this message translates to:
  /// **'Ver menos categorias'**
  String get home_categories_less;

  /// No description provided for @home_filter.
  ///
  /// In pt, this message translates to:
  /// **'Filtrar'**
  String get home_filter;

  /// No description provided for @home_emphasis_title.
  ///
  /// In pt, this message translates to:
  /// **'Destaques'**
  String get home_emphasis_title;

  /// No description provided for @home_emphasis_all.
  ///
  /// In pt, this message translates to:
  /// **'Ver todos os destaques'**
  String get home_emphasis_all;

  /// No description provided for @home_emphasis_less.
  ///
  /// In pt, this message translates to:
  /// **'Ver menos destaques'**
  String get home_emphasis_less;

  /// No description provided for @home_events_this_week.
  ///
  /// In pt, this message translates to:
  /// **'Esta semana'**
  String get home_events_this_week;

  /// No description provided for @home_events_next_weeek.
  ///
  /// In pt, this message translates to:
  /// **'Próxima semana'**
  String get home_events_next_weeek;

  /// No description provided for @home_events_next_month.
  ///
  /// In pt, this message translates to:
  /// **'Próximo mês'**
  String get home_events_next_month;

  /// No description provided for @home_spaces_title.
  ///
  /// In pt, this message translates to:
  /// **'Espaços'**
  String get home_spaces_title;

  /// No description provided for @home_spaces_all.
  ///
  /// In pt, this message translates to:
  /// **'Ver todos os espaços'**
  String get home_spaces_all;

  /// No description provided for @home_spaces_less.
  ///
  /// In pt, this message translates to:
  /// **'Ver menos espaços'**
  String get home_spaces_less;

  /// No description provided for @location_title.
  ///
  /// In pt, this message translates to:
  /// **'Localização'**
  String get location_title;

  /// No description provided for @location_search.
  ///
  /// In pt, this message translates to:
  /// **'Digite sua localização'**
  String get location_search;

  /// No description provided for @location_subtitle.
  ///
  /// In pt, this message translates to:
  /// **'Usar minha localização'**
  String get location_subtitle;

  /// No description provided for @location_error.
  ///
  /// In pt, this message translates to:
  /// **'Localização não encontrada! Tente informar o endereço com rua, bairro e cidade'**
  String get location_error;

  /// No description provided for @location_no_permission.
  ///
  /// In pt, this message translates to:
  /// **'Para acessar a localização é necessário permitir o acesso ao GPS nas configurações do seu dispositivo!'**
  String get location_no_permission;

  /// No description provided for @location_latitude.
  ///
  /// In pt, this message translates to:
  /// **'Latitude:'**
  String get location_latitude;

  /// No description provided for @location_longitude.
  ///
  /// In pt, this message translates to:
  /// **'Longitude:'**
  String get location_longitude;

  /// No description provided for @location_loading.
  ///
  /// In pt, this message translates to:
  /// **'Localizando...'**
  String get location_loading;

  /// No description provided for @location_unselected.
  ///
  /// In pt, this message translates to:
  /// **'Para retirar a localização inserida, basta clicar novamente no item e sair.'**
  String get location_unselected;

  /// No description provided for @schedule_title.
  ///
  /// In pt, this message translates to:
  /// **'Agenda'**
  String get schedule_title;

  /// No description provided for @schedule_choice_data.
  ///
  /// In pt, this message translates to:
  /// **'Escolha uma data'**
  String get schedule_choice_data;

  /// No description provided for @schedule_choice_in.
  ///
  /// In pt, this message translates to:
  /// **'De:'**
  String get schedule_choice_in;

  /// No description provided for @schedule_choice_until.
  ///
  /// In pt, this message translates to:
  /// **'Até:'**
  String get schedule_choice_until;

  /// No description provided for @schedule_view_day.
  ///
  /// In pt, this message translates to:
  /// **'Visualizar por dia'**
  String get schedule_view_day;

  /// No description provided for @schedule_results.
  ///
  /// In pt, this message translates to:
  /// **'Resultados'**
  String get schedule_results;

  /// No description provided for @schedule_filter.
  ///
  /// In pt, this message translates to:
  /// **'Filtrar'**
  String get schedule_filter;

  /// No description provided for @schedule_filter_subtitle.
  ///
  /// In pt, this message translates to:
  /// **'Termo a pesquisar'**
  String get schedule_filter_subtitle;

  /// No description provided for @map_title.
  ///
  /// In pt, this message translates to:
  /// **'Mapa'**
  String get map_title;

  /// No description provided for @map_suggestion.
  ///
  /// In pt, this message translates to:
  /// **'Sugestão'**
  String get map_suggestion;

  /// No description provided for @map_empty_events.
  ///
  /// In pt, this message translates to:
  /// **'Sem eventos para visualizacão.'**
  String get map_empty_events;

  /// No description provided for @favorites_title.
  ///
  /// In pt, this message translates to:
  /// **'Favoritos'**
  String get favorites_title;

  /// No description provided for @favorites_warning.
  ///
  /// In pt, this message translates to:
  /// **'Para exibir os favoritos é preciso estar logado no aplicativo.'**
  String get favorites_warning;

  /// No description provided for @profile_title.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profile_title;

  /// No description provided for @profile_account.
  ///
  /// In pt, this message translates to:
  /// **'Conta'**
  String get profile_account;

  /// No description provided for @profile_account_data.
  ///
  /// In pt, this message translates to:
  /// **'Dados cadastrais'**
  String get profile_account_data;

  /// No description provided for @profile_account_data_alert.
  ///
  /// In pt, this message translates to:
  /// **'Para exibir seus dados é preciso estar logado no aplicativo. Gostaria de ir para a página de login?'**
  String get profile_account_data_alert;

  /// No description provided for @profile_account_data_alert_accept.
  ///
  /// In pt, this message translates to:
  /// **'Sim'**
  String get profile_account_data_alert_accept;

  /// No description provided for @profile_general.
  ///
  /// In pt, this message translates to:
  /// **'Geral'**
  String get profile_general;

  /// No description provided for @profile_general_terms.
  ///
  /// In pt, this message translates to:
  /// **'Termos e Serviços'**
  String get profile_general_terms;

  /// No description provided for @profile_general_alert.
  ///
  /// In pt, this message translates to:
  /// **'Essa ação abrirá uma nova aba no navegador. Deseja continuar?'**
  String get profile_general_alert;

  /// No description provided for @profile_general_alert_accept.
  ///
  /// In pt, this message translates to:
  /// **'Sim'**
  String get profile_general_alert_accept;

  /// No description provided for @profile_general_help.
  ///
  /// In pt, this message translates to:
  /// **'Ajuda'**
  String get profile_general_help;

  /// No description provided for @profile_general_upon.
  ///
  /// In pt, this message translates to:
  /// **'Sobre o app'**
  String get profile_general_upon;

  /// No description provided for @profile_general_upon_title.
  ///
  /// In pt, this message translates to:
  /// **'Sobre o Aplicativo'**
  String get profile_general_upon_title;

  /// No description provided for @profile_general_upon_text.
  ///
  /// In pt, this message translates to:
  /// **'O aplicativo cultura.ce apresenta a agenda de eventos da Rede Pública de Espaços e Equipamentos Culturais da Secult Ceará (Rece), a partir das informações disponíveis no Siscult - Mapa Cultural do Ceará.\n\nEle atende a uma demanda do campo cultural e de toda a sociedade: disponibilizar, de forma fácil, centralizada e interativa, toda a programação cultural do Estado. Feito pensando na melhor experiência de usabilidade para garantir ao público o acesso às programações culturais, em sua maioria gratuitas.\n\nA primeira versão possui diversas funcionalidades de busca e visualização de eventos, além de opções de notificações e lembretes. Conta também recurso de acessibilidade para pessoas com deficiência visual.\n\nEste projeto é uma realização da Secretaria da Cultura do Estado do Ceará (Secult) e desenvolvido pelo Instituto Dragão do Mar. Tem parceria com o Instituto Mirante de Cultura e Arte e com o Laboratório de Inovação e Dados do Governo do Ceará (Íris).'**
  String get profile_general_upon_text;

  /// No description provided for @profile_general_evaluate.
  ///
  /// In pt, this message translates to:
  /// **'Avalie o app'**
  String get profile_general_evaluate;

  /// No description provided for @profile_accessibility.
  ///
  /// In pt, this message translates to:
  /// **'Acessibilidade'**
  String get profile_accessibility;

  /// No description provided for @profile_accessibility_resources.
  ///
  /// In pt, this message translates to:
  /// **'Recursos'**
  String get profile_accessibility_resources;

  /// No description provided for @profile_accessibility_save.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get profile_accessibility_save;

  /// No description provided for @profile_accessibility_resume.
  ///
  /// In pt, this message translates to:
  /// **'Para garantir uma melhor experiência defina os recursos que irão lhe ajudar durante o uso do aplicativo'**
  String get profile_accessibility_resume;

  /// No description provided for @profile_language.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get profile_language;

  /// No description provided for @notification_attention.
  ///
  /// In pt, this message translates to:
  /// **'Atenção!'**
  String get notification_attention;

  /// No description provided for @notification_ok.
  ///
  /// In pt, this message translates to:
  /// **'Ok'**
  String get notification_ok;

  /// No description provided for @notification_cancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get notification_cancel;

  /// No description provided for @login_enter.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get login_enter;

  /// No description provided for @login_text.
  ///
  /// In pt, this message translates to:
  /// **'Para entrar é necessário que você tenha se cadastrado no nosso aplicativo.'**
  String get login_text;

  /// No description provided for @login_email.
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get login_email;

  /// No description provided for @login_password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get login_password;

  /// No description provided for @login_reset_password.
  ///
  /// In pt, this message translates to:
  /// **'Esqueci minha senha'**
  String get login_reset_password;

  /// No description provided for @login_reset_password_text.
  ///
  /// In pt, this message translates to:
  /// **'Insira um email para receber o link de recuperação de senha.'**
  String get login_reset_password_text;

  /// No description provided for @login_reset_password_send.
  ///
  /// In pt, this message translates to:
  /// **'Enviar'**
  String get login_reset_password_send;

  /// No description provided for @login_notify_empty.
  ///
  /// In pt, this message translates to:
  /// **'Os campos precisam ser preenchidos.'**
  String get login_notify_empty;

  /// No description provided for @login_notify_invalid.
  ///
  /// In pt, this message translates to:
  /// **'Email inválido.'**
  String get login_notify_invalid;

  /// No description provided for @login_notify_reset.
  ///
  /// In pt, this message translates to:
  /// **'Você precisa alterar sua senha para entrar no aplicativo.'**
  String get login_notify_reset;

  /// No description provided for @login_notify_reset_button.
  ///
  /// In pt, this message translates to:
  /// **'Alterar Senha'**
  String get login_notify_reset_button;

  /// No description provided for @login_notify_data_invalid.
  ///
  /// In pt, this message translates to:
  /// **'Dados incorretos, verifique o email e senha e tente novamente.'**
  String get login_notify_data_invalid;

  /// No description provided for @login_reset_conclude_title.
  ///
  /// In pt, this message translates to:
  /// **'Email enviado com sucesso!'**
  String get login_reset_conclude_title;

  /// No description provided for @login_reset_conclude_subtitle.
  ///
  /// In pt, this message translates to:
  /// **'Verifique seu email para saber sua nova senha.'**
  String get login_reset_conclude_subtitle;

  /// No description provided for @register.
  ///
  /// In pt, this message translates to:
  /// **'Cadastre-se'**
  String get register;

  /// No description provided for @register_title.
  ///
  /// In pt, this message translates to:
  /// **'Cadastro'**
  String get register_title;

  /// No description provided for @register_subtitle.
  ///
  /// In pt, this message translates to:
  /// **'Ao se cadastrar, você terá acesso aos recursos de gerar alertas e de avaliar espaços e eventos.'**
  String get register_subtitle;

  /// No description provided for @register_name.
  ///
  /// In pt, this message translates to:
  /// **'Nome'**
  String get register_name;

  /// No description provided for @register_email.
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get register_email;

  /// No description provided for @register_password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get register_password;

  /// No description provided for @register_confirm_password.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar Senha'**
  String get register_confirm_password;

  /// No description provided for @register_password_order.
  ///
  /// In pt, this message translates to:
  /// **'Sua senha deve conter:'**
  String get register_password_order;

  /// No description provided for @register_password_order_one.
  ///
  /// In pt, this message translates to:
  /// **'No mínimo 6 dígitos'**
  String get register_password_order_one;

  /// No description provided for @register_password_order_two.
  ///
  /// In pt, this message translates to:
  /// **'Pelo menos 1 letra maiúscula'**
  String get register_password_order_two;

  /// No description provided for @register_password_order_three.
  ///
  /// In pt, this message translates to:
  /// **'Pelo menos 1 letra minúscula'**
  String get register_password_order_three;

  /// No description provided for @register_password_order_four.
  ///
  /// In pt, this message translates to:
  /// **'Pelo menos 1 número'**
  String get register_password_order_four;

  /// No description provided for @register_password_order_five.
  ///
  /// In pt, this message translates to:
  /// **'Força da senha:'**
  String get register_password_order_five;

  /// No description provided for @register_terms_one.
  ///
  /// In pt, this message translates to:
  /// **'Ao se cadastrar, você concorda com os '**
  String get register_terms_one;

  /// No description provided for @register_terms_two.
  ///
  /// In pt, this message translates to:
  /// **'Termos de Serviço '**
  String get register_terms_two;

  /// No description provided for @register_terms_three.
  ///
  /// In pt, this message translates to:
  /// **'e a '**
  String get register_terms_three;

  /// No description provided for @register_terms_four.
  ///
  /// In pt, this message translates to:
  /// **'Política de Privacidade '**
  String get register_terms_four;

  /// No description provided for @register_terms_five.
  ///
  /// In pt, this message translates to:
  /// **'do cultura.ce.'**
  String get register_terms_five;

  /// No description provided for @registern_notify_weak_password.
  ///
  /// In pt, this message translates to:
  /// **'Senha fraca.'**
  String get registern_notify_weak_password;

  /// No description provided for @register_notify_different_passwords.
  ///
  /// In pt, this message translates to:
  /// **'Senhas não coincidem.'**
  String get register_notify_different_passwords;

  /// No description provided for @register_notify_accept_terms.
  ///
  /// In pt, this message translates to:
  /// **'Por favor, aceite os Termos de Serviço.'**
  String get register_notify_accept_terms;

  /// No description provided for @register_notify_register_conclude.
  ///
  /// In pt, this message translates to:
  /// **'Cadastro realizado!'**
  String get register_notify_register_conclude;

  /// No description provided for @register_notify_register_conclude_text.
  ///
  /// In pt, this message translates to:
  /// **'Clique no botão abaixo para prosseguir.'**
  String get register_notify_register_conclude_text;

  /// No description provided for @register_conclude.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar-se'**
  String get register_conclude;

  /// No description provided for @visitor.
  ///
  /// In pt, this message translates to:
  /// **'Entrar como visitante'**
  String get visitor;

  /// No description provided for @e_title.
  ///
  /// In pt, this message translates to:
  /// **'Evento'**
  String get e_title;

  /// No description provided for @e_title_e.
  ///
  /// In pt, this message translates to:
  /// **'Espaço'**
  String get e_title_e;

  /// No description provided for @e_category.
  ///
  /// In pt, this message translates to:
  /// **'Categoria'**
  String get e_category;

  /// No description provided for @e_descr.
  ///
  /// In pt, this message translates to:
  /// **'Descrição'**
  String get e_descr;

  /// No description provided for @e_descr_more.
  ///
  /// In pt, this message translates to:
  /// **'Ler mais'**
  String get e_descr_more;

  /// No description provided for @e_descr_less.
  ///
  /// In pt, this message translates to:
  /// **'Ler menos'**
  String get e_descr_less;

  /// No description provided for @e_location.
  ///
  /// In pt, this message translates to:
  /// **'Localização'**
  String get e_location;

  /// No description provided for @e_accessibility.
  ///
  /// In pt, this message translates to:
  /// **'Acessibilidade'**
  String get e_accessibility;

  /// No description provided for @e_accessibility_default.
  ///
  /// In pt, this message translates to:
  /// **'Informações indisponíveis no momento'**
  String get e_accessibility_default;

  /// No description provided for @e_more_info.
  ///
  /// In pt, this message translates to:
  /// **'Mais informações'**
  String get e_more_info;

  /// No description provided for @e_more_info_free.
  ///
  /// In pt, this message translates to:
  /// **'Gratuito'**
  String get e_more_info_free;

  /// No description provided for @e_more_info_classif.
  ///
  /// In pt, this message translates to:
  /// **'Classificação'**
  String get e_more_info_classif;

  /// No description provided for @e_more_info_years.
  ///
  /// In pt, this message translates to:
  /// **'anos'**
  String get e_more_info_years;

  /// No description provided for @e_more_info_classif_free.
  ///
  /// In pt, this message translates to:
  /// **'Livre'**
  String get e_more_info_classif_free;

  /// No description provided for @e_more_info_entry.
  ///
  /// In pt, this message translates to:
  /// **'Entrada'**
  String get e_more_info_entry;

  /// No description provided for @e_more_info_paid.
  ///
  /// In pt, this message translates to:
  /// **'Pago'**
  String get e_more_info_paid;

  /// No description provided for @e_more_info_scheduling.
  ///
  /// In pt, this message translates to:
  /// **'Agende aqui a sua visita'**
  String get e_more_info_scheduling;

  /// No description provided for @e_evaluation.
  ///
  /// In pt, this message translates to:
  /// **'Avaliar evento'**
  String get e_evaluation;

  /// No description provided for @e_evaluation_e.
  ///
  /// In pt, this message translates to:
  /// **'Avaliar espaço'**
  String get e_evaluation_e;

  /// No description provided for @e_evaluation_one.
  ///
  /// In pt, this message translates to:
  /// **'Gostei'**
  String get e_evaluation_one;

  /// No description provided for @e_evaluation_two.
  ///
  /// In pt, this message translates to:
  /// **'Não Gostei'**
  String get e_evaluation_two;

  /// No description provided for @e_evaluation_three.
  ///
  /// In pt, this message translates to:
  /// **'Não aconteceu'**
  String get e_evaluation_three;

  /// No description provided for @e_evaluation_three_e.
  ///
  /// In pt, this message translates to:
  /// **'Está fechado'**
  String get e_evaluation_three_e;

  /// No description provided for @e_alert_events.
  ///
  /// In pt, this message translates to:
  /// **'Para avaliar um evento você precisa se logar, gostaria de ir para a página de login?'**
  String get e_alert_events;

  /// No description provided for @e_alert_coments.
  ///
  /// In pt, this message translates to:
  /// **'Deseja realizar um comentário?'**
  String get e_alert_coments;

  /// No description provided for @e_alert_coments_no.
  ///
  /// In pt, this message translates to:
  /// **'Não'**
  String get e_alert_coments_no;

  /// No description provided for @e_alert_coments_title.
  ///
  /// In pt, this message translates to:
  /// **'Comentário'**
  String get e_alert_coments_title;

  /// No description provided for @e_alert_coments_title_two.
  ///
  /// In pt, this message translates to:
  /// **'Comentário (opcional)'**
  String get e_alert_coments_title_two;

  /// No description provided for @e_alert_send.
  ///
  /// In pt, this message translates to:
  /// **'Enviar'**
  String get e_alert_send;

  /// No description provided for @e_alert_spaces.
  ///
  /// In pt, this message translates to:
  /// **'Para avaliar um espaço você precisa se logar, gostaria de ir para a página de login?'**
  String get e_alert_spaces;

  /// No description provided for @e_ticket.
  ///
  /// In pt, this message translates to:
  /// **'Ingresso'**
  String get e_ticket;

  /// No description provided for @e_ticket_search.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar'**
  String get e_ticket_search;

  /// No description provided for @e_programming_default.
  ///
  /// In pt, this message translates to:
  /// **'Não existe eventos programados nesse espaço'**
  String get e_programming_default;

  /// No description provided for @e_programming.
  ///
  /// In pt, this message translates to:
  /// **'Programacao'**
  String get e_programming;

  /// No description provided for @e_alert_favorite.
  ///
  /// In pt, this message translates to:
  /// **'Para favoritar é preciso estar logado no aplicativo. Gostaria de ir para a página de login?'**
  String get e_alert_favorite;

  /// No description provided for @e_alert_favorite_page.
  ///
  /// In pt, this message translates to:
  /// **'Para acessar os favoritos é preciso estar logado no aplicativo. Gostaria de ir para a página de login?'**
  String get e_alert_favorite_page;

  /// No description provided for @filter_spaces.
  ///
  /// In pt, this message translates to:
  /// **'Espaços Culturais'**
  String get filter_spaces;

  /// No description provided for @filter_sel_space.
  ///
  /// In pt, this message translates to:
  /// **'Selecionar espaço'**
  String get filter_sel_space;

  /// No description provided for @filter_periode.
  ///
  /// In pt, this message translates to:
  /// **'Período'**
  String get filter_periode;

  /// No description provided for @filter_periode_one.
  ///
  /// In pt, this message translates to:
  /// **'Hoje'**
  String get filter_periode_one;

  /// No description provided for @filter_periode_two.
  ///
  /// In pt, this message translates to:
  /// **'Amanhã'**
  String get filter_periode_two;

  /// No description provided for @filter_periode_three.
  ///
  /// In pt, this message translates to:
  /// **'Essa Semana'**
  String get filter_periode_three;

  /// No description provided for @filter_periode_four.
  ///
  /// In pt, this message translates to:
  /// **'Próxima Semana'**
  String get filter_periode_four;

  /// No description provided for @filter_periode_five.
  ///
  /// In pt, this message translates to:
  /// **'Próximo Mês'**
  String get filter_periode_five;

  /// No description provided for @filter_ticket_one.
  ///
  /// In pt, this message translates to:
  /// **'Todos'**
  String get filter_ticket_one;

  /// No description provided for @filter_ticket_two.
  ///
  /// In pt, this message translates to:
  /// **'Gratuito'**
  String get filter_ticket_two;

  /// No description provided for @filter_ticket_three.
  ///
  /// In pt, this message translates to:
  /// **'Pago'**
  String get filter_ticket_three;

  /// No description provided for @accessibility_1.
  ///
  /// In pt, this message translates to:
  /// **'Elevador'**
  String get accessibility_1;

  /// No description provided for @accessibility_2.
  ///
  /// In pt, this message translates to:
  /// **'Elevador adaptado'**
  String get accessibility_2;

  /// No description provided for @accessibility_3.
  ///
  /// In pt, this message translates to:
  /// **'Rampa de acesso'**
  String get accessibility_3;

  /// No description provided for @accessibility_4.
  ///
  /// In pt, this message translates to:
  /// **'Sinalização tátil'**
  String get accessibility_4;

  /// No description provided for @accessibility_5.
  ///
  /// In pt, this message translates to:
  /// **'Vaga de estacionamento exclusiva para idosos'**
  String get accessibility_5;

  /// No description provided for @accessibility_6.
  ///
  /// In pt, this message translates to:
  /// **'Corrimão nas escadas e rampas'**
  String get accessibility_6;

  /// No description provided for @accessibility_7.
  ///
  /// In pt, this message translates to:
  /// **'Banheiros adaptados'**
  String get accessibility_7;

  /// No description provided for @accessibility_8.
  ///
  /// In pt, this message translates to:
  /// **'Bebedouro adaptado'**
  String get accessibility_8;

  /// No description provided for @accessibility_9.
  ///
  /// In pt, this message translates to:
  /// **'Sanitário adaptado'**
  String get accessibility_9;

  /// No description provided for @accessibility_10.
  ///
  /// In pt, this message translates to:
  /// **'Cadeira de rodas para uso do visitante'**
  String get accessibility_10;

  /// No description provided for @accessibility_11.
  ///
  /// In pt, this message translates to:
  /// **'Vaga de estacionamento exclusiva para deficientes'**
  String get accessibility_11;

  /// No description provided for @accessibility_12.
  ///
  /// In pt, this message translates to:
  /// **'Circuito de visitação adaptado'**
  String get accessibility_12;

  /// No description provided for @categories_1.
  ///
  /// In pt, this message translates to:
  /// **'Música'**
  String get categories_1;

  /// No description provided for @categories_2.
  ///
  /// In pt, this message translates to:
  /// **'Teatro'**
  String get categories_2;

  /// No description provided for @categories_3.
  ///
  /// In pt, this message translates to:
  /// **'Circo'**
  String get categories_3;

  /// No description provided for @categories_4.
  ///
  /// In pt, this message translates to:
  /// **'Audiovisual'**
  String get categories_4;

  /// No description provided for @categories_5.
  ///
  /// In pt, this message translates to:
  /// **'Artes Integradas'**
  String get categories_5;

  /// No description provided for @categories_6.
  ///
  /// In pt, this message translates to:
  /// **'Cultura digital'**
  String get categories_6;

  /// No description provided for @categories_7.
  ///
  /// In pt, this message translates to:
  /// **'Cultura indígena'**
  String get categories_7;

  /// No description provided for @categories_8.
  ///
  /// In pt, this message translates to:
  /// **'Cultura popular'**
  String get categories_8;

  /// No description provided for @categories_9.
  ///
  /// In pt, this message translates to:
  /// **'Formação'**
  String get categories_9;

  /// No description provided for @categories_10.
  ///
  /// In pt, this message translates to:
  /// **'Dança'**
  String get categories_10;

  /// No description provided for @categories_11.
  ///
  /// In pt, this message translates to:
  /// **'Literatura'**
  String get categories_11;

  /// No description provided for @categories_12.
  ///
  /// In pt, this message translates to:
  /// **'Outros'**
  String get categories_12;

  /// No description provided for @categories_13.
  ///
  /// In pt, this message translates to:
  /// **'Artes Visuais'**
  String get categories_13;

  /// No description provided for @categories_14.
  ///
  /// In pt, this message translates to:
  /// **'Cultura Alimentar'**
  String get categories_14;

  /// No description provided for @categories_15.
  ///
  /// In pt, this message translates to:
  /// **'Cultura Afro-brasileira'**
  String get categories_15;

  /// No description provided for @categories_16.
  ///
  /// In pt, this message translates to:
  /// **'Esporte'**
  String get categories_16;

  /// No description provided for @categories_17.
  ///
  /// In pt, this message translates to:
  /// **'Humor'**
  String get categories_17;

  /// No description provided for @categories_18.
  ///
  /// In pt, this message translates to:
  /// **'Jogos'**
  String get categories_18;

  /// No description provided for @categories_19.
  ///
  /// In pt, this message translates to:
  /// **'Meio Ambiente'**
  String get categories_19;

  /// No description provided for @categories_20.
  ///
  /// In pt, this message translates to:
  /// **'Moda'**
  String get categories_20;

  /// No description provided for @categories_21.
  ///
  /// In pt, this message translates to:
  /// **'Gestão Cultural'**
  String get categories_21;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'it', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
