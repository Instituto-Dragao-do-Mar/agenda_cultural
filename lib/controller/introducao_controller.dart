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
          texto: "Com o aplicativo cultura.ce você tem acesso à toda a programação da Rede Pública de Equipamentos Culturais da Secult Ceará num só lugar!",
          ordem: 1,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'introducao1.png',
          ),
        ),
        Introducao(
          texto: "Conheça os espaços e eventos por data, categoria e com base na sua localização.",
          ordem: 2,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'introducao2.png',
          ),
        ),
        Introducao(
          texto: "Você pode ainda gerar alertas, avaliar espaços e eventos, além de favoritar o que te interessa para não perder nenhuma atualização.",
          ordem: 3,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'introducao3.png',
          ),
        ),
      },
    );
    return retorno;
  }
}
