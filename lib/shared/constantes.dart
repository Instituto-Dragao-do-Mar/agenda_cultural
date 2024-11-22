import 'package:flutter/material.dart';

const isProduction = true;
const urlApiHomolg = "https://apiagendacultural.redeinova.com.br/api/";
const urlApiProd = "https://api.agenda.cultura.ce.gov.br/api/";
const String baseUrlApi = isProduction ? urlApiProd : urlApiHomolg;

const LinearGradient gradientPrincipal = LinearGradient(
  colors: [Color(0xffEA5B0C), Color(0xffE83C3B)],
);
