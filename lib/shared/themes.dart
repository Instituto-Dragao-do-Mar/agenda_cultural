import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cores.dart';

var themeDefault = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor:  const Color(0xFFE83C3B),
  backgroundColor: corBackgroundLaranja,
  textTheme: GoogleFonts.poppinsTextTheme(),

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
