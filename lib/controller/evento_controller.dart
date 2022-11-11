import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/endereco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/imagem_model.dart';

class EventoController extends BaseController {
  Future<ListaEvento> eventoGet({
    required String userguidid,
  }) async {
    ListaEvento retorno = ListaEvento();

    retorno.eventos = [];
    retorno.eventos!.addAll(
      {
        Evento(
          descricao: "Lorem ipsum class imperdiet enim netus litora tempus "
              "habitant sollicitudin, sed euismod litora lobortis sed condimentum "
              "dictum morbi nisi sit, interdum per tincidunt netus eu vulputate "
              "ante malesuada. ornare iaculis eros quam viverra dui volutpat tortor "
              "quisque odio, rhoncus aenean odio nullam vehicula tellus curabitur "
              "ligula, nullam orci aenean convallis ligula praesent habitant quis. "
              "primis ad auctor et dictumst aliquam quisque non lacus elementum, "
              "sollicitudin ultrices nam malesuada phasellus taciti sagittis "
              "suspendisse a nullam, torquent pellentesque aenean lacus hac mi ut "
              "sed. enim id justo fusce sapien adipiscing himenaeos sem tristique, "
              "nisl cubilia hendrerit scelerisque diam phasellus imperdiet. ",
          nome: "Esposição de Arte",
          classificacao: "Livre",
          datas: [
            "2022-10-30 21:00:00",
          ],
          destaque: true,
          entradagratuita: 1,
          categoria: Categoria(
            titulo: "Cinema",
          ),
          endereco: Endereco(
            bairro: "Sao Joao do Tauape",
            cep: "60130240",
            cidade: "Fortaleza",
            latitude: 36.0,
            longitude: 12.0,
            logradouro: "Av Pontes Vieira",
            numero: "326",
            uf: "CE",
          ),
          listaImagem: ListaImagem(imagens: [
            Imagem(
              tipoimagem: TipoImagem.url,
              url: './imagens/evento2.png',
            ),
          ]),
        ),
        Evento(
          descricao: "Lorem ipsum class imperdiet enim netus litora tempus "
              "habitant sollicitudin, sed euismod litora lobortis sed condimentum "
              "dictum morbi nisi sit, interdum per tincidunt netus eu vulputate "
              "ante malesuada. ornare iaculis eros quam viverra dui volutpat tortor "
              "quisque odio, rhoncus aenean odio nullam vehicula tellus curabitur "
              "ligula, nullam orci aenean convallis ligula praesent habitant quis. "
              "primis ad auctor et dictumst aliquam quisque non lacus elementum, "
              "sollicitudin ultrices nam malesuada phasellus taciti sagittis "
              "suspendisse a nullam, torquent pellentesque aenean lacus hac mi ut "
              "sed. enim id justo fusce sapien adipiscing himenaeos sem tristique, "
              "nisl cubilia hendrerit scelerisque diam phasellus imperdiet. ",
          nome: "Evento teste 1",
          classificacao: "Livre",
          datas: [
            "2022-10-30 18:00:00",
            "2022-10-31 22:00:00",
          ],
          destaque: true,
          entradagratuita: 1,
          categoria: Categoria(
            titulo: "Música",
          ),
          endereco: Endereco(
            bairro: "Sao Joao do Tauape",
            cep: "60130240",
            cidade: "Fortaleza",
            latitude: 36.0,
            longitude: 12.0,
            logradouro: "Av Pontes Vieira",
            numero: "326",
            uf: "CE",
          ),
          listaImagem: ListaImagem(imagens: [
            Imagem(
              tipoimagem: TipoImagem.url,
              url: './imagens/evento1.png',
            ),
          ]),
        ),
        Evento(
          descricao: "Lorem ipsum class imperdiet enim netus litora tempus "
              "habitant sollicitudin, sed euismod litora lobortis sed condimentum "
              "dictum morbi nisi sit, interdum per tincidunt netus eu vulputate "
              "ante malesuada. ornare iaculis eros quam viverra dui volutpat tortor "
              "quisque odio, rhoncus aenean odio nullam vehicula tellus curabitur "
              "ligula, nullam orci aenean convallis ligula praesent habitant quis. "
              "primis ad auctor et dictumst aliquam quisque non lacus elementum, "
              "sollicitudin ultrices nam malesuada phasellus taciti sagittis "
              "suspendisse a nullam, torquent pellentesque aenean lacus hac mi ut "
              "sed. enim id justo fusce sapien adipiscing himenaeos sem tristique, "
              "nisl cubilia hendrerit scelerisque diam phasellus imperdiet. ",
          nome: "Esposição de Arte",
          classificacao: "Livre",
          datas: [
            "2022-10-30 09:00:00",
          ],
          destaque: true,
          entradagratuita: 1,
          categoria: Categoria(
            titulo: "Teatro",
          ),
          endereco: Endereco(
            bairro: "Sao Joao do Tauape",
            cep: "60130240",
            cidade: "Fortaleza",
            latitude: 36.0,
            longitude: 12.0,
            logradouro: "Av Pontes Vieira",
            numero: "326",
            uf: "CE",
          ),
          listaImagem: ListaImagem(imagens: [
            Imagem(
              tipoimagem: TipoImagem.url,
              url: './imagens/evento2.png',
            ),
          ]),
        ),
      },
    );
    return retorno;
  }
}
