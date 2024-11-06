class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'bandeirabrasil.png', 'Português', 'pt'),
      Language(2, 'bandeiraeua.png', 'English', 'en'),
      Language(3, 'bandeiraespanha.png', 'Spanish', 'es'),
      Language(4, 'bandeirafranca.png', 'French', 'fr'),
      Language(5, 'bandeiraitalia.png', 'Italian', 'it'),
    ];
  }
}
