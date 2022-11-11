import 'package:agendacultural/model/imagem_model.dart';

class ListaCategoria {
  List<Categoria>? categorias;

  ListaCategoria({
    this.categorias,
  });
}

class Categoria {
  String? titulo;
  Imagem? imagem;
  bool? selecionada;

  Categoria({
    this.imagem,
    this.titulo,
    this.selecionada = false,
  });
}
