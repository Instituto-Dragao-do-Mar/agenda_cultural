class Acesso {
  String? nome;
  String? datacadastro;
  String? dataalteracao;
  int? alterarsenhaproximologin;
  String? email;
  String? signature;
  String? expiration;
  String? dataUltimaSincronizacao;

  Acesso({
    this.nome,
    this.datacadastro,
    this.dataalteracao,
    this.alterarsenhaproximologin,
    this.email,
    this.signature,
    this.expiration,
    this.dataUltimaSincronizacao,
  });

  Acesso.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    datacadastro = json['datacadastro'];
    dataalteracao = json['dataalteracao'];
    alterarsenhaproximologin = json['alterarsenhaproximologin'];
    email = json['email'];
    signature = json['signature'];
    expiration = json['expiration'];
    dataUltimaSincronizacao = json['dataUltimaSincronizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['datacadastro'] = this.datacadastro;
    data['dataalteracao'] = this.dataalteracao;
    data['alterarsenhaproximologin'] = this.alterarsenhaproximologin;
    data['email'] = this.email;
    data['signature'] = this.signature;
    data['expiration'] = this.expiration;
    data['dataUltimaSincronizacao'] = this.dataUltimaSincronizacao;
    return data;
  }
}
