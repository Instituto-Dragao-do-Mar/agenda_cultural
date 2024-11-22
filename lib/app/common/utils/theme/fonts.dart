import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';

class FontsApp {
  static const int tamanhoFonteBase16 = 16;
  static int tamanhoBase = 16;

  static void setTamanhoBase(int tamanho) => tamanhoBase = tamanho;

  static TextStyle poppins18W500Black(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho + 2,
          fontWeight: FontWeight.w500,
          color: !ColorsApp.contraste ? Colors.black : Colors.white,
        ),
      );

  static TextStyle poppins16W500Black(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: !ColorsApp.contraste ? Colors.black : Colors.white,
        ),
      );

  static TextStyle poppins16W400Black(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w400,
          color: !ColorsApp.contraste ? Colors.black : Colors.white,
        ),
      );

  static TextStyle poppins14W400Black(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble() - 2,
          fontWeight: FontWeight.w400,
          color: !ColorsApp.contraste ? Colors.black : Colors.white,
        ),
      );

  static TextStyle poppins12W400Grey(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho - 4,
          fontWeight: FontWeight.w400,
          color: const Color(0xff999999),
        ),
      );

  static TextStyle poppins12W300Grey(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho - 4,
          fontWeight: FontWeight.w400,
          color: const Color(0xff999999),
        ),
      );

  static TextStyle poppins14W300Grey(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho - 2,
          fontWeight: FontWeight.w400,
          color: const Color(0xff999999),
        ),
      );

  static TextStyle poppins16W400Grey(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w400,
          color: const Color(0Xff999999),
        ),
      );

  static TextStyle poppins14W400Grey(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho - 2,
          fontWeight: FontWeight.w400,
          color: const Color(0xff999999),
        ),
      );

  static TextStyle poppins14W400E83C3B(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho - 2,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFEA5B0C),
        ),
      );

  static TextStyle poppins14W400222(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho - 2,
          fontWeight: FontWeight.w400,
          color: !ColorsApp.contraste ? const Color(0XFF222222) : Colors.white,
        ),
      );

  static TextStyle poppins18W400222(int tamanho) => GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: tamanho + 2,
          fontWeight: FontWeight.w400,
          color: !ColorsApp.contraste ? const Color(0XFF222222) : Colors.white,
        ),
      );

  static TextStyle roboto16W400Grey(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: const Color(0xff999999),
        ),
      );

  static TextStyle roboto12W400Grey(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho - 4,
          fontWeight: FontWeight.w400,
          color: const Color(0xff666666),
        ),
      );

  static TextStyle roboto12W300Grey(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho - 4,
          fontWeight: FontWeight.w300,
          color: !ColorsApp.contraste ? const Color(0xff666666) : Colors.white,
        ),
      );

  static TextStyle roboto12W300Green(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho - 4,
          fontWeight: FontWeight.w300,
          color: Colors.green,
        ),
      );

  static TextStyle roboto16W400Black(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: !ColorsApp.contraste ? const Color(0XFF000000) : Colors.white,
        ),
      );

  static TextStyle roboto14W400Black(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho - 2,
          fontWeight: FontWeight.w500,
          color: !ColorsApp.contraste ? Colors.black : Colors.white,
        ),
      );

  static TextStyle roboto16W400EA5(int tamanho) => GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: const Color(0XFFEA5B0C),
        ),
      );

  static TextStyle inter16W400Black(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: const Color(0XFF000000),
        ),
      );

  static TextStyle inter16W400Grey(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: !ColorsApp.contraste ? const Color(0XFF666666) : Colors.white,
        ),
      );

  static TextStyle inter24W500Withe(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho + 8,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );

  static TextStyle inter16W700Withe(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w700,
          color: ColorsApp.contraste ? Colors.black : Colors.white,
        ),
      );

  static TextStyle inter16W500Black(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      );

  static TextStyle inter14W500Grey(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: const Color(0XFF999999),
        ),
      );

  static TextStyle inter14W500EA5B0C(int tamanho) => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: tamanho.toDouble(),
          fontWeight: FontWeight.w500,
          color: const Color(0XFFEA5B0C),
        ),
      );
}
