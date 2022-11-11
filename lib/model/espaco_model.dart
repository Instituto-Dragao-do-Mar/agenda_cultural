import 'package:agendacultural/model/acessibilidade_model.dart';
import 'package:agendacultural/model/endereco_model.dart';
import 'package:agendacultural/model/imagem_model.dart';

class Espaco {
  String? id;
  String? guidid;
  String? nome;
  String? data;
  String? descricao;
  Endereco? endereco;
  ListaAcessibilidade? listaAcessibilidade;
  ListaImagem? listaImagem;

  Espaco({
    this.data,
    this.descricao,
    this.endereco,
    this.guidid,
    this.id,
    this.nome,
    this.listaAcessibilidade,
    this.listaImagem,
  });
}
