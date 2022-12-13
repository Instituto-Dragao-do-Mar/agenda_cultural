import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const urlApiIDM = "https://apiagendacultural.redeinova.com.br/api/";

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

final LinearGradient gradientPrincipal = LinearGradient(
  colors: [
    Color(0xffEA5B0C),
    Color(0xffE83C3B),
  ],
);

bool isPerfil = false;
const InputDecoration textfieldPerfil = InputDecoration(
  filled: true,
  fillColor: Color.fromRGBO(217, 217, 217, 8.2),
  contentPadding: EdgeInsets.all(16),
  focusColor: Colors.black,
  border: OutlineInputBorder(
    borderSide: BorderSide(
      width: .5,
      color: Color(0XFFD9D9D9),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  ),
);
