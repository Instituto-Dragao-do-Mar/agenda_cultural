enum TipoImagem {
  url,
  base64,
}

class Imagem {
  TipoImagem? tipoimagem;
  String? base64;
  String? url;
  Imagem({
    this.base64,
    this.tipoimagem,
    this.url,
  });
}

class ListaImagem {
  List<Imagem>? imagens;
  ListaImagem({
    this.imagens,
  });
}
