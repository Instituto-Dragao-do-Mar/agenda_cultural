class ListaUsuarios {
  List<Usuario>? usuarios;

  ListaUsuarios({this.usuarios});

  ListaUsuarios.fromJson(Map<String, dynamic> json) {
    if (json['usuarios'] != null) {
      usuarios = <Usuario>[];
      json['usuarios'].forEach((v) {
        usuarios!.add(new Usuario.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuarios != null) {
      data['usuarios'] = this.usuarios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usuario {
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

  Usuario(
      {this.id,
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
      this.expiration});

  Usuario.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['guidid'] = this.guidid;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['idimagem'] = this.idimagem;
    data['datacadastro'] = this.datacadastro;
    data['ativo'] = this.ativo;
    data['cpf'] = this.cpf;
    data['cpfcnpj'] = this.cpfcnpj;
    data['alterarsenhaproximologin'] = this.alterarsenhaproximologin;
    data['dataalteracao'] = this.dataalteracao;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['uf'] = this.uf;
    data['complemento'] = this.complemento;
    return data;
  }
}
