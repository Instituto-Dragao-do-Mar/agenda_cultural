import 'package:agendacultural/model/imagem_model.dart';

class ListaIntroducao {
  List<Introducao>? introducoes;
  
  ListaIntroducao({
    this.introducoes,
  });
}

class Introducao {
  String? texto;
  int? ordem;
  Imagem? imagem;

  Introducao({
    this.ordem,
    this.texto,
    this.imagem,
  });
}
