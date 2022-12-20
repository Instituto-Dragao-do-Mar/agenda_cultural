import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgets/widgettopoperfil.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

import '../../model/fontes.dart';

class widgetIdiomas extends StatefulWidget {
  const widgetIdiomas({Key? key}) : super(key: key);

  @override
  _widgetIdiomasState createState() => _widgetIdiomasState();
}

class _widgetIdiomasState extends State<widgetIdiomas> {
  int? valor = 0;
  int opcaoSelecionada = 0;

  List<Widget> subPaginas = [
    const widgetHome(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    const widgetEmConstrucao(),
    widgetPerfil(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoPerfil(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            opcaoSelecionada = i;
          });
        },
        backgroundColor: corBgAtual,
        elevation: 0,
        showUnselectedLabels: true,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.grey,
        currentIndex: opcaoSelecionada,
        items: [
          BottomNavigationBarItem(
            backgroundColor: corBgAtual,
            icon: widgetImagemInterna(
                imagem: Imagem(
              url: 'fhome.png',
            )),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: corBgAtual,
            icon: widgetImagemInterna(
                imagem: Imagem(
              url: 'fagenda.png',
            )),
            label: "Agenda",
          ),
          BottomNavigationBarItem(
            backgroundColor: corBgAtual,
            icon: widgetImagemInterna(
                imagem: Imagem(
              url: 'fmapa.png',
            )),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            backgroundColor: corBgAtual,
            icon: widgetImagemInterna(
                imagem: Imagem(
              url: 'ffavorito.png',
            )),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            backgroundColor: corBgAtual,
            icon: widgetImagemInterna(
                imagem: Imagem(
              url: 'fperfil.png',
            )),
            label: "Perfil",
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextContrasteFonte(
              text:"Idioma",
              style: Fontes.poppins18W500Black(Fontes.tamanhoBase),
            ),
            const widgetEspacoH(altura: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextContrasteFonte(
                  text: "Português",
                  style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
                ),
                IconButton(
                  iconSize: 32,
                  hoverColor: Colors.transparent,
                  icon: valor == 0 ? radioOn : radioOff,
                  onPressed: () {
                    setState(() {
                      valor = 0;
                    });
                  },
                ),
                // Radio(
                //   value: 0,
                //   groupValue: groupValue,
                //   onChanged: (value) {
                //     setState(() {
                //       groupValue = value;
                //       print(groupValue);
                //     });
                //   },
                // )
              ],
            ),
            const widgetEspacoH(
              altura: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextContrasteFonte(
                  text: "Inglês",
                  style: Fontes.roboto16W400Black(Fontes.tamanhoBase),
                ),
                IconButton(
                  iconSize: 32,
                  hoverColor: Colors.transparent,
                  icon: valor == 1 ? radioOn : radioOff,
                  onPressed: () {
                    setState(() {
                      valor = 1;
                    });
                  },
                )
                // Radio(
                //   value: 1,
                //   groupValue: groupValue,
                //   onChanged: (value) {
                //     setState(() {
                //       groupValue = value;
                //       print(groupValue);
                //     });
                //   },
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
