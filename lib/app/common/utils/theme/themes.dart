import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';

var themeDefault = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFE83C3B),
  colorScheme: ColorScheme.light(surface: corBackgroundLaranja),
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

const LinearGradient gradientPrincipal = LinearGradient(colors: [Color(0xffEA5B0C), Color(0xffE83C3B)]);

var corBackgroundLaranja = const Color(0xFFEA5B0C);

const corBg = Colors.white;
var corBgAtual = !ColorsApp.contraste ? Colors.white : Colors.black;

var corAppBarAtual = !ColorsApp.contraste ? Colors.white : Colors.black;

const corText = Colors.black;
var corTextAtual = !ColorsApp.contraste ? Colors.black : Colors.white;
