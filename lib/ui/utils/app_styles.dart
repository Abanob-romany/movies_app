import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/ui/utils/app_colors.dart';

abstract final class AppStyle {
  static TextStyle bold24Black = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
  static TextStyle bold24White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
  static TextStyle regular24White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.normal,
      fontSize: 24,
    ),
  );
  static TextStyle regular20White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
  );
  static TextStyle regular20black = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
  );
  static TextStyle bold20White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
  static TextStyle bold20Black = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
  static TextStyle bold20primary = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
  static TextStyle regular16primary = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
  );
  static TextStyle regular16White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
  );
  static TextStyle bold16White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
  static TextStyle regular14primary = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );
  static TextStyle bold14primary = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );
  static TextStyle regular14White = GoogleFonts.roboto(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );

}
