import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/introducao_model.dart';
import 'package:agendacultural/pages/introducao/introducaoacessibilidade.dart';
import 'package:agendacultural/pages/introducao/introducaoapresentacao.dart';
import 'package:agendacultural/pages/introducao/introducaoidioma.dart';

class IntroducaoController extends BaseController {
  Future<ListaIntroducao> introducaoGet({
    required String userguidid,
  }) async {
    ListaIntroducao retorno = ListaIntroducao();

    retorno.introducoes = [];
    retorno.introducoes!.addAll(
      {
        Introducao(
          widget: const IntroducaoIdiomaWidget(),
          ordem: 1,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'introducao1.jpg',
          ),
        ),
        Introducao(
          widget: const IntroducaoAcessibilidadeWidget(),
          ordem: 2,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'introducao2.jpg',
          ),
        ),
        Introducao(
          widget: const IntroducaoApresentacaoWidget(),
          ordem: 3,
          imagem: Imagem(
            tipoimagem: TipoImagem.url,
            url: 'introducao3.jpg',
          ),
        ),
      },
    );
    return retorno;
  }
}
