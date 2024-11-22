import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

const isProduction = true;
const urlApiHomolg = "https://apiagendacultural.redeinova.com.br/api/";
const urlApiProd = "https://api.agenda.cultura.ce.gov.br/api/";
const String baseUrlApi = isProduction ? urlApiProd : urlApiHomolg;

const LinearGradient gradientPrincipal = LinearGradient(
  colors: [Color(0xffEA5B0C), Color(0xffE83C3B)],
);

InputDecoration textFielData = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  contentPadding: const EdgeInsets.all(16),
  focusColor: Colors.black,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: corBackgroundLaranja),
    borderRadius: const BorderRadius.all(Radius.circular(5)),
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);

enum ControllerStates { idle, loading, success, error, created, unauthorized }
