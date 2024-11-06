// ignore_for_file: constant_identifier_names

import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

const IS_PRODUCTION = true;

const urlApiHomolg = "https://apiagendacultural.redeinova.com.br/api/";
const urlApiProd = "https://api.agenda.cultura.ce.gov.br/api/";
const String baseUrlApi = IS_PRODUCTION ? urlApiProd : urlApiHomolg;

const kGoogleApiKey = "AIzaSyBHnw0ov66Rh1UCjnK3pfuh5Y-yoG44FTg";

final Image radioOff = Image.network(
  "radiooff.png",
  width: 32,
  height: 32,
);
final Image radioOn = Image.network(
  "radioon.png",
  width: 38,
  height: 38,
);

const LinearGradient gradientPrincipal = LinearGradient(
  colors: [
    Color(0xffEA5B0C),
    Color(0xffE83C3B),
  ],
);

bool isPerfil = false;
InputDecoration textfieldDadosCadastro = InputDecoration(
  filled: true,
  fillColor: const Color.fromRGBO(217, 217, 217, 8.2),
  contentPadding: const EdgeInsets.all(16),
  focusColor: Colors.black,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 3,
      color: corBackgroundLaranja,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 3,
      color: Color(0XFFD9D9D9),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  ),
);

enum ControllerStates { idle, loading, success, error, created, unauthorized }
