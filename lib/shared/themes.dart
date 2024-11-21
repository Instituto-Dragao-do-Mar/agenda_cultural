import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/model/colors.dart';

var themeDefault = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFE83C3B),
  colorScheme: ColorScheme.light(background: corBackgroundLaranja),
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: AppBarTheme(backgroundColor: corBgAtual),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEA5B0C)),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.grey,
    selectionColor: Colors.grey.shade300,
    selectionHandleColor: Colors.grey,
  ),
);

var corBackgroundLaranja = const Color(0xFFEA5B0C);
var corBackgroundNegative = Colors.white;

const corBg = Colors.white;
const corBgAltoContraste = Colors.black;
var corBgAtual = !ColorsApp.contraste ? Colors.white : Colors.black;

const corAppBar = Colors.white;
const corAppBarAltoContraste = Colors.black;
var corAppBarAtual = !ColorsApp.contraste ? Colors.white : Colors.black;

const corText = Colors.black;
const corTextAltoContraste = Colors.white;
var corTextAtual = !ColorsApp.contraste ? Colors.black : Colors.white;
