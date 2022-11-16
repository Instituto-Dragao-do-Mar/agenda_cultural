
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/cupertino.dart';

import '../../shared/constantes.dart';
import '../../shared/widgetbotaoswitch.dart';

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
  @override
  Widget build(BuildContext context) {
    bool status1 = false;
    return Padding(
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
                widgetBotaoSwitch(value: status1,),
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
               widgetBotaoSwitch(value: status1,),
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
              widgetBotaoSwitch(value: status1,),
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
                widgetBotaoSwitch(value: status1,),
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
                widgetBotaoSwitch(value: status1,),
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
              widgetBotaoSwitch(value: status1,),
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
                widgetBotaoSwitch(value: status1,),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
