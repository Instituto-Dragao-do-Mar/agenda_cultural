import 'package:agendacultural/model/acessibilidade_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/endereco_model.dart';
import 'package:agendacultural/model/imagem_model.dart';

class ListaEvento {
  List<Evento>? eventos;

  ListaEvento({
    this.eventos,
  });
}

class Evento {
  String? id;
  String? guidid;
  String? nome;
  List<String>? datas;
  String? descricao;
  Endereco? endereco;
  String? classificacao;
  int? entradagratuita;
  String? urlentrada;
  ListaAcessibilidade? listaAcessibilidade;
  ListaImagem? listaImagem;
  bool? destaque;
  Categoria? categoria;

  Evento({
    this.classificacao,
    this.datas,
    this.descricao,
    this.endereco,
    this.entradagratuita,
    this.guidid,
    this.id,
    this.nome,
    this.listaAcessibilidade,
    this.listaImagem,
    this.destaque,
    this.categoria,
    this.urlentrada,
  });

}
