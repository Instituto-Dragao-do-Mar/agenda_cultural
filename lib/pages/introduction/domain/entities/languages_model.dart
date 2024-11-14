class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'flag_brasil.png', 'Português', 'pt'),
      Language(2, 'flag_usa.png', 'English', 'en'),
      Language(3, 'flag_spain.png', 'Spanish', 'es'),
      Language(4, 'flag_france.png', 'French', 'fr'),
      Language(5, 'flag_italia.png', 'Italian', 'it'),
    ];
  }
}
