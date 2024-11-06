import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/pages/espacos/pageespacodetalhe.dart';

class ItemSpaceWidget extends StatelessWidget {
  final Espaco espaco;

  const ItemSpaceWidget({
    super.key,
    required this.espaco,
  });

  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context, listen: false);

    var imagemEspaco = espaco.espacosimagens?.first.imagens?.first.url;

    if (espaco.espacosimagens == null || espaco.espacosimagens!.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageEspacoDetalhe(espaco: espaco),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !Cores.contraste ? const Color(0xFFF6F6F6) : Colors.black.withOpacity(.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
              width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
              child: imagemEspaco == null
                  ? Image.asset(
                      'imagens/Outros - 1padrao.png',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imagemEspaco.replaceAll("homolog", ""),
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8),
              child: LayoutBuilder(
                builder: (p0, p1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      TextContrasteFonte(
                        text: espaco.nome!,
                        maxlines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
                          fontWeight: FontWeight.w500,
                          color: corTextAtual,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Flex(
                        direction: Axis.vertical,
                        children: [
                          TextContrasteFonte(
                            text: app.GetEnderecoEspaco(espaco),
                            style: GoogleFonts.roboto(
                              fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
                              color: corTextAtual,
                            ),
                            maxlines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
