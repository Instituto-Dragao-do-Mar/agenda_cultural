import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle poppins18W500Black = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
);
final TextStyle poppins16W400Black = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
);
final TextStyle poppins12W400Grey = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff999999),
  ),
);
final TextStyle poppins12W300Grey = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff999999),
  ),
);
final TextStyle poppins16W400Grey = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0Xff999999),
  ),
);
final TextStyle poppins14W400Grey = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff999999),
  ),
);
final TextStyle poppins14W400E83C3B = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0XFFE83C3B),
  ),
);
final TextStyle poppins14W400222 = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0XFF222222),
  ),
);
final TextStyle roboto16W400Grey = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xff999999),
  ),
);
final TextStyle roboto12W400Grey = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xff666666),
  ),
);
final TextStyle roboto12W300Grey = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Color(0xff666666),
  ),
);
final TextStyle roboto16W400Black = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFF000000),
  ),
);
final TextStyle roboto14W400Black = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0XFF000000),
  ),
);
final TextStyle roboto16W400EA5 = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFFEA5B0C),
  ),
);
final TextStyle inter16W400Black = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFF000000),
  ),
);
final TextStyle inter16W400Grey = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFF666666),
  ),
);
final TextStyle inter24W500Withe = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color(0XFFF9E8D8),
  ),
);
final TextStyle inter16W700Withe = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(0XFFF9E8D8),
  ),
);
final TextStyle inter16W500Black = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFF000000),
  ),
);
final TextStyle inter14W500Grey = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFF999999),
  ),
);
final TextStyle inter14W500EA5B0C = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0XFFEA5B0C),
  ),
);
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
