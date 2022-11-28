// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/constrants.dart';
import 'package:flutter/material.dart';
import 'package:platform_info/platform_info.dart';

Image widgetImagem({
  required Imagem imagem,
  BoxFit? fit,
  double? height,
  double? width,
}) {

  return Image.asset('imagens/' + imagem.url!); 
}
