class Access {
  String? nome;
  String? datacadastro;
  String? dataalteracao;
  int? alterarsenhaproximologin;
  String? email;
  String? signature;
  String? expiration;
  String? dataUltimaSincronizacao;

  Access({
    this.nome,
    this.datacadastro,
    this.dataalteracao,
    this.alterarsenhaproximologin,
    this.email,
    this.signature,
    this.expiration,
    this.dataUltimaSincronizacao,
  });

  Access.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['datacadastro'] = datacadastro;
    data['dataalteracao'] = dataalteracao;
    data['alterarsenhaproximologin'] = alterarsenhaproximologin;
    data['email'] = email;
    data['signature'] = signature;
    data['expiration'] = expiration;
    data['dataUltimaSincronizacao'] = dataUltimaSincronizacao;
    return data;
  }
}
