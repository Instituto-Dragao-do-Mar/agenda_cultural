// ignore_for_file: missing_return

import 'dart:html';

import 'package:flutter/material.dart';


enum EditPopupType {
  texto,
  data,
  drop,
  datahora,
  ligadesliga,
}

class EditPopup {
  String? titulo;
  EditPopupType? tipo;
  TextEditingController? edit;
  bool? obrigatorio;
  List<String>? opcoes;
  Function(String)? funcao;
  int? maxlines;

  EditPopup({
    this.titulo,
    this.edit,
    this.tipo,
    this.obrigatorio,
    this.opcoes,
    this.funcao,
    this.maxlines,
  });
}

typedef MyFunction = Future<bool> Function();

Future<void> showPopupDialog({
  BuildContext? context,
  List<EditPopup>? edits,
  MyFunction? funcaoBtnOk,
  String? titulo,
}) {
  return showDialog<void>(
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo ?? "Informe os parâmetros"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
          height: (edits!.length * 32) + 120.0,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: edits.map((e) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _getField(context, e), flex: 3),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () async {
              if (funcaoBtnOk != null) {
                bool retorno = await funcaoBtnOk();
                if (retorno) {
                  Navigator.of(context).pop();
                }
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

Future<void> showFuturePopupDialog({
  BuildContext? context,
  List<EditPopup>? edits,
  MyFunction? funcaoBtnOk,
  String? titulo,
}) async {
  await showDialog<void>(
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo ?? "Informe os parâmetros"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(
          height: (edits!.length * 32) + 120.0,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: edits.map((e) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _getField(context, e), flex: 3),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () async {
              if (funcaoBtnOk != null) {
                bool retorno = await funcaoBtnOk();
                if (retorno) {
                  Navigator.of(context).pop();
                }
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

Widget _getField(BuildContext context, EditPopup e) {
  switch (e.tipo) {
    case EditPopupType.texto:
      return TextFormField(
        controller: e.edit,
        /* context: context,
        controller: e.edit,
        readonly: false,
        labelText: e.titulo,
        maxlines: e.maxlines == null ? 1 : e.maxlines, */
      );
    /*case EditPopupType.data:
      return WidgetData(
        controller: e.edit!,
        labeltext: e.titulo!,
        readonly: false,
      );
      break;*/
    /*case EditPopupType.datahora:
      return WidgetDataHora(
        controller: e.edit!,
        labeltext: e.titulo!,
        readonly: false,
      );
      break;*/
    case EditPopupType.drop:
    return Container();


    default:
return Container();

     /* return widgetDropdownSearch(
        hint: e.titulo,
        itens: e.opcoes,
        funcao: e.funcao,
        enable: true,
        valorInicial: e.edit.text,
      );/
      break;
    /*case EditPopupType.ligadesliga:
      return WidgetSwitch(
        ted: e.edit!,
        titulo: e.titulo!,
        border: true,
        funcao: () {},
      );
      break;*/
    /*default:
      return widgetTextFormField(
        context: context,
        controller: e.edit!,
        readonly: false,
        labelText: e.titulo!,
      );
      break;*/
    case EditPopupType.data:
      // ignore: todo
      // TODO: Handle this case.
      break;
    case EditPopupType.datahora:
      // ignore: todo
      // TODO: Handle this case.
      break;
    case EditPopupType.ligadesliga:
      // ignore: todo
      // TODO: Handle this case.
      break;*/
  }
}
