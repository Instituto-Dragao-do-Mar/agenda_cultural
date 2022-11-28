import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgets/widgettopoperfil.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/constantes.dart';
import '../../shared/widgetbotaoswitch.dart';
import 'widgetperfil.dart';

class widgetNotificacoes extends StatefulWidget {
  const widgetNotificacoes({Key? key}) : super(key: key);

  @override
  _widgetNotificacoesState createState() => _widgetNotificacoesState();
}

class _widgetNotificacoesState extends State<widgetNotificacoes> {
  bool status1 = false;
  // bool status2 = false;
  // bool status3 = false;
  // bool status4 = false;
  // bool status5 = false;
  // bool status6 = false;
  // bool status7 = false;
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
          title: widgetTopoPerfil(),
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
              icon: widgetImagem(
                  imagem: Imagem(
                url: 'bottomhome.png',
              )),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: 'bottomcalendario.png',
              )),
              label: "Agenda",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: 'bottommapa.png',
              )),
              label: "Mapa",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: 'bottomfavoritos.png',
              )),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: widgetImagem(
                  imagem: Imagem(
                url: 'bottomperfil.png',
              )),
              label: "Perfil",
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notificações e alertas",
                  style: poppins18W500Black,
                ),
                const widgetEspacoH(altura: 16),
                Text(
                  "Habilitar notificações",
                  style: roboto16W400Black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Escolha se deseja receber notificações",
                      style: poppins12W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 20),
                Text(
                  "Notificação push",
                  style: roboto16W400Black,
                ),
                Text(
                  "Escolha quais notificações deseja receber no seu celular",
                  style: poppins12W400Grey,
                ),
                const widgetEspacoH(altura: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lembretes de alertas",
                      style: poppins14W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Atualização da programação",
                      style: poppins14W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 25),
                Text(
                  "Notificação por e-mail",
                  style: roboto16W400Black,
                ),
                Text(
                  "Escolha quais notificações deseja receber por e-mail",
                  style: poppins12W400Grey,
                ),
                const widgetEspacoH(altura: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lembretes de alertas",
                      style: poppins14W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Atualização da programação",
                      style: poppins14W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 25),
                Text(
                  "Receber alertas",
                  style: roboto16W400Black,
                ),
                Text(
                  "Defina quando deseja receber alertas de eventos",
                  style: poppins12W400Grey,
                ),
                const widgetEspacoH(altura: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 dia antes do evento",
                      style: poppins14W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
                const widgetEspacoH(altura: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 semana antes do evento",
                      style: poppins14W400Grey,
                    ),
                    widgetBotaoSwitch(
                      value: status1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
