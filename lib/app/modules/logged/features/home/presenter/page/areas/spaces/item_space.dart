import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/espacos/space_detail_page.dart';

class ItemSpaceWidget extends StatelessWidget {
  final Espaco space;

  const ItemSpaceWidget({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    if (space.espacosimagens == null || space.espacosimagens?.isEmpty == true) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpaceDetailPage(espaco: space),
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
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 3, offset: const Offset(0, 0))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
              width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
              child: space.espacosimagens?.first.imagens?.first.url == null
                  ? Image.asset(
                      'imagens/Outros - 1padrao.png',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      space.espacosimagens?.first.imagens?.first.url?.replaceAll("homolog", "") ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'imagens/Outros - 1padrao.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  TextContrasteFonte(
                    text: space.nome ?? 'Nome não informado!',
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
                        text: space.endereco != '' ? space.endereco : "Endereço não informado!",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
