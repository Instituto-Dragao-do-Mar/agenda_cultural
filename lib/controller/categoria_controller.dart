import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/imagem_model.dart';

class CategoriaController extends BaseController {
  Future<ListaCategoria> categoriaGet({
    required String userguidid,
  }) async {
    ListaCategoria retorno = ListaCategoria();

    retorno.categorias = [];
    retorno.categorias!.addAll(
      {
        Categoria(
          titulo: "Cinema",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriacinema.png',
          ),
        ),
        Categoria(
          titulo: "Música",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriamusica.png',
          ),
        ),
        Categoria(
          titulo: "Dançca",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriadanca.png',
          ),
        ),
        Categoria(
          titulo: "Teatro",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriateatro.png',
          ),
        ),
        Categoria(
          titulo: "Circo",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriacirco.png',
          ),
        ),
        Categoria(
          titulo: "Teatro",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriateatro.png',
          ),
        ),
        Categoria(
          titulo: "Circo",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriacirco.png',
          ),
        ),
        Categoria(
          titulo: "Teatro",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriateatro.png',
          ),
        ),
        Categoria(
          titulo: "Circo",
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'categoriacirco.png',
          ),
        ),
      },
    );
    return retorno;
  }
}
