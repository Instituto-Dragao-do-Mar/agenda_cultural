class ListaUsuarios {
  List<User>? usuarios;

  ListaUsuarios({this.usuarios});

  ListaUsuarios.fromJson(Map<String, dynamic> json) {
    if (json['usuarios'] != null) {
      usuarios = <User>[];
      json['usuarios'].forEach((v) {
        usuarios!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usuarios != null) {
      data['usuarios'] = usuarios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? login;
  String? guidid;
  String? nome;
  String? email;
  String? telefone;
  String? idimagem;
  String? datacadastro;
  int? ativo;
  String? cpf;
  String? cpfcnpj;
  int? alterarsenhaproximologin;
  String? dataalteracao;
  String? cep;
  String? logradouro;
  String? numero;
  String? bairro;
  String? cidade;
  String? uf;
  String? complemento;
  String? signature;
  String? expiration;

  User({
    this.id,
    this.login,
    this.guidid,
    this.nome,
    this.email,
    this.telefone,
    this.idimagem,
    this.datacadastro,
    this.ativo,
    this.cpf,
    this.cpfcnpj,
    this.alterarsenhaproximologin,
    this.dataalteracao,
    this.cep,
    this.logradouro,
    this.numero,
    this.bairro,
    this.cidade,
    this.uf,
    this.complemento,
    this.signature,
    this.expiration,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    guidid = json['guidid'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
    idimagem = json['idimagem'];
    datacadastro = json['datacadastro'];
    ativo = json['ativo'];
    cpf = json['cpf'];
    cpfcnpj = json['cpfcnpj'];
    alterarsenhaproximologin = json['alterarsenhaproximologin'];
    dataalteracao = json['dataalteracao'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
    complemento = json['complemento'];
    signature = json['signature'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['login'] = login;
    data['guidid'] = guidid;
    data['nome'] = nome;
    data['email'] = email;
    data['telefone'] = telefone;
    data['idimagem'] = idimagem;
    data['datacadastro'] = datacadastro;
    data['ativo'] = ativo;
    data['cpf'] = cpf;
    data['cpfcnpj'] = cpfcnpj;
    data['alterarsenhaproximologin'] = alterarsenhaproximologin;
    data['dataalteracao'] = dataalteracao;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['numero'] = numero;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['uf'] = uf;
    data['complemento'] = complemento;
    return data;
  }
}
