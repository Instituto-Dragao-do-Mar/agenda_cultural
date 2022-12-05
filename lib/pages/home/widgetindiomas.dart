import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgets/widgettopoperfil.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class widgetIndiomas extends StatefulWidget {
  const widgetIndiomas({Key? key}) : super(key: key);

  @override
  _widgetIndiomasState createState() => _widgetIndiomasState();
}

class _widgetIndiomasState extends State<widgetIndiomas> {
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
    return SafeArea(
      bottom: true,
      top: true,
      minimum: const EdgeInsets.symmetric(vertical: 16),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: corBackgroundNegative,
          elevation: 0,
          leadingWidth: 0,
          title: const widgetTopoPerfil(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            setState(() {
              opcaoSelecionada = i;
            });
          },
          backgroundColor: corBackgroundNegative,
          elevation: 0,
          showUnselectedLabels: true,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.grey,
          currentIndex: opcaoSelecionada,
          items: [
            BottomNavigationBarItem(
              backgroundColor: corBackgroundNegative,
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomhome.png',
              )),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomcalendario.png',
              )),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottommapa.png',
              )),
              label: "Mapa",
            ),
            BottomNavigationBarItem(
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomfavoritos.png',
              )),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: widgetImagemInterna(
                  imagem: Imagem(
                url: 'bottomperfil.png',
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
              Text(
                "Idioma",
                style: poppins18W500Black,
              ),
              const widgetEspacoH(altura: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Português",
                    style: roboto16W400Black,
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
                  Text(
                    "Inglês",
                    style: roboto16W400Black,
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
      ),
    );
  }
}
