
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';

class widgetIndiomas extends StatefulWidget {
  const widgetIndiomas({Key? key}) : super(key: key);

  @override
  _widgetIndiomasState createState() => _widgetIndiomasState();
}

class _widgetIndiomasState extends State<widgetIndiomas> {
  int? valor = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
