import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cores.dart';

var themeDefault = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: const Color(0xFFE83C3B),
  backgroundColor: corBackground,
  textTheme: GoogleFonts.poppinsTextTheme(),

  // ignore: prefer_const_constructors
  appBarTheme: AppBarTheme(
    backgroundColor: corBackgroundNegative
    
  ),

  

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFEA5B0C),
    ),
  ),
);

var corBackground = Color(0xFFEA5B0C);
var corBackgroundNegative = Colors.white;

const corBg = Colors.white;
const corBgAltoContraste = Colors.black;

const corAppBar = Colors.white;
const corAppBarAltoContraste = Colors.black;

const corText = Colors.black;
const corTextAltoContraste = Colors.white;
