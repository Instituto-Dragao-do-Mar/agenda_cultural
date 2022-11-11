import 'package:date_format/date_format.dart';

class Endereco {
  String? logradouro;
  String? numero;
  String? cep;
  String? bairro;
  String? cidade;
  String? complemento;
  String? uf;
  String? pontoreferencia;
  double? latitude;
  double? longitude;

  Endereco({
    this.bairro,
    this.cep,
    this.cidade,
    this.complemento,
    this.latitude,
    this.logradouro,
    this.longitude,
    this.numero,
    this.pontoreferencia,
    this.uf,
  });

  @override
  String toString() {    
    return "$logradouro, $numero, $bairro, $cidade - $uf";
  }

   String getEnderecoShort() {    
    return "$logradouro, $numero";
  }
}

