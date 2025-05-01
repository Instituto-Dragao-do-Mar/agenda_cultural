// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cores.dart';

var corBackgroundLaranja = Color(0xFFEA5B0C);
var corBackgroundNegative = Colors.white;

const corBg = Colors.white;
const corBgAltoContraste = Colors.black;
var corBgAtual = !Cores.contraste ? Colors.white : Colors.black;

const corAppBar = Colors.white;
const corAppBarAltoContraste = Colors.black;
var corAppBarAtual = !Cores.contraste ? Colors.white : Colors.black;

const corText = Colors.black;
const corTextAltoContraste = Colors.white;
var corTextAtual = !Cores.contraste ? Colors.black : Colors.white;

var themeDefault = ThemeData(
  // Define the default brightness and colors.
  // brightness: Brightness.light,
  primaryColor:  const Color(0xFFE83C3B),
  // scaffoldBackgroundColor: corBackgroundLaranja,
  // textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
  ),
  // ignore: prefer_const_constructors
  appBarTheme: AppBarTheme(
    backgroundColor: corBgAtual
    
  ),  

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFEA5B0C),
    ),
  ),
);

InputDecoration InputDecorationDefault({
  String? hint,
}) {
  return InputDecoration(
    hintText: hint ?? '',
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
}

