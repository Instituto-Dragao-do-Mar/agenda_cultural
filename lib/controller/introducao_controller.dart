import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/introducao_model.dart';

class IntroducaoController extends BaseController {
  Future<ListaIntroducao> introducaoGet({
    required String userguidid,
  }) async {
    ListaIntroducao retorno = ListaIntroducao();

    retorno.introducoes = [];
    retorno.introducoes!.addAll(
      {
        Introducao(
          texto: "Com o aplicativo Cultura no Bolsl você "
              "tem acesso a programação cultural do estado "
              "do Ceará.",
          ordem: 1,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: './imagens/introducao1.png',
          ),
        ),
        Introducao(
          texto: "Está por dentro dos espaços e eventos "
              "que estão acontecendo baseado na sua localização.",
          ordem: 2,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: './imagens/introducao2.png',
          ),
        ),
        Introducao(
          texto: "E ainda gerar alertas, avaliar espaços e "
              "eventos, além de favoritar o que te interessa.",
          ordem: 3,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: './imagens/introducao3.png',
          ),
        ),
      },
    );
    return retorno;
  }
}
