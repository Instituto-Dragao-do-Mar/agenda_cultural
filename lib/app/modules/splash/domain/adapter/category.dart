import 'package:agendacultural/app/modules/splash/domain/adapter/category_image.dart';

class Category {
  int? id;
  String? nome;
  int? ativa;
  String? guidid;
  List<CategoryImage>? imagens;
  bool? selecionada = false;

  Category({
    this.id,
    this.nome,
    this.ativa,
    this.guidid,
    this.imagens,
    this.selecionada,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    ativa = json['ativa'];
    guidid = json['guidid'];
    if (json['imagens'] != null) {
      imagens = <CategoryImage>[];
      json['imagens'].forEach((v) {
        imagens!.add(CategoryImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['ativa'] = ativa;
    data['guidid'] = guidid;
    if (imagens != null) {
      data['imagens'] = imagens!.map((v) => v.toJson()).toList();
    }
    data['selecionada'] = selecionada;
    return data;
  }
}
