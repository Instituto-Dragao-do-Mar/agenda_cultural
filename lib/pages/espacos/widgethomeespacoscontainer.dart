// ignore_for_file: camel_case_types, must_be_immutable

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';

// import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/espacos/pageespacodetalhe.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';

// import 'package:agendacultural/shared/widgetimagemexterna.dart';
// import 'package:agendacultural/shared/widgetimagemhtml.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/cores.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class widgetHomeEspacosContainer extends StatelessWidget {
  widgetHomeEspacosContainer({
    super.key,
    required this.espaco,
  });

  final Espaco espaco;

  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    var imagemEspaco = espaco.espacosimagens?.first.imagens?.first.url;

    if (espaco.espacosimagens == null || espaco.espacosimagens!.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageEspacoDetalhe(
              espaco: espaco,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Card(
          child: SizedBox(
            height: 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
            width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
            child: Container(
              height: 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
              width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    (!Cores.contraste ? const Color(0xFFEDEDED).withOpacity(.2) : corBgAltoContraste.withOpacity(.8)),
                border: Border.all(width: 1, color: corBg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 150 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
                      width: 180 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(0),
                          top: Radius.circular(10),
                        ),
                      ),
                      child: imagemEspaco == null
                          ? Image.asset(
                              'imagens/Outros - 1padrao.png',
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              imagemEspaco.replaceAll("homolog", ""),
                            ),
                      // widgetImagemHtml(
                      //   url: imagemEspaco.replaceAll("homolog", ""),
                      // )
                      // widgetImagemHtml(
                      //         url: imagemEspaco.replaceAll("homolog", ""),
                      //       ),
                      // espaco.espacosimagens!.first.imagens!.first.url ==
                      //         null
                      //  const SizedBox.shrink()
                      // ? ClipRRect(
                      //     borderRadius: const BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         topRight: Radius.circular(10)),
                      //     child: Image.network(
                      //       loadingBuilder:
                      //           (context, child, loadingProgress) {
                      //         if (loadingProgress == null) {
                      //           return child;
                      //         }
                      //         return const Center(
                      //           heightFactor: 1.5,
                      //           child: CircularProgressIndicator(
                      //             strokeWidth: 2.0,
                      //             color: Colors.black,
                      //           ),
                      //         );
                      //       },
                      //       errorBuilder: (context, child, loadingProgress) {
                      //         return Image.asset(
                      //           'assets/imagens/Outros - 1padrao.png',
                      //           fit: BoxFit.cover,
                      //         );
                      //       },
                      //       espaco.espacosimagens!.first.imagens!.first.url!,
                      //       fit: BoxFit.cover,
                      //       width: double.infinity,
                      //     ),
                      //   )
                      // : ClipRRect(
                      //     borderRadius: const BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         topRight: Radius.circular(10)),
                      //     child: Image.network(
                      //       loadingBuilder:
                      //           (context, child, loadingProgress) {
                      //         if (loadingProgress == null) {
                      //           // return widgetImagemHtml(
                      //           //   url: espaco.espacosimagens!.first.imagens!
                      //           //       .first.url!,
                      //           // );
                      //           return child;
                      //         }
                      //         return const Center(
                      //           heightFactor: 1.5,
                      //           child: CircularProgressIndicator(
                      //             strokeWidth: 2.0,
                      //             color: Colors.black,
                      //           ),
                      //         );
                      //       },
                      //       errorBuilder: (context, child, loadingProgress) {
                      //         return const widgetImagemHtml(
                      //           url: '../../../imagens/Outros - 1padrao.png',
                      //         );
                      //         // return Image.asset(
                      //         //   '../../../imagens/Outros - 1padrao.png',
                      //         //   fit: BoxFit.cover,
                      //         // );
                      //       },
                      //       espaco.espacosimagens!.first.imagens!.first.url!,
                      //       fit: BoxFit.cover,
                      //       width: double.infinity,
                      //     ),
                      //   ),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8),
                    child: LayoutBuilder(
                      builder: (p0, p1) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const widgetEspacoH(altura: 6),
                            TextContrasteFonte(
                              text: espaco.nome!,
                              maxlines: 1,
                              style: GoogleFonts.roboto(
                                fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 12),
                                fontWeight: FontWeight.w500,
                                color: corTextAtual,
                              ),
                            ),
                            const widgetEspacoH(altura: 6),
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
                            const widgetEspacoH(altura: 6),
                            //
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
