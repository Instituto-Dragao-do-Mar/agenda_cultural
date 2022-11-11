import 'package:flutter/material.dart';

import '../../shared/constantes.dart';
import '../../shared/widgetespacoh.dart';

class widgetnotificacoes extends StatefulWidget {
  const widgetnotificacoes({Key? key}) : super(key: key);

  @override
  _widgetnotificacoesState createState() => _widgetnotificacoesState();
}

class _widgetnotificacoesState extends State<widgetnotificacoes> {
  @override
  Widget build(BuildContext context) {
    bool toggled = false;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notificações e alertas",
            style: poppins18W500Black,
          ),
          const widgetEspacoH(altura: 16),
          SwitchListTile(
            title: Text("Habilitar notificações",),
            subtitle: Text("Escolha se deseja receber notificações",),
            activeColor: Color(0XFFe83c3b),
            value: toggled,
            onChanged: (bool value) {},
          ),
         
        ],
      ),
    );
  }
}
