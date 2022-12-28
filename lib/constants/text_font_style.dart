import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();

  //new
  // h semibold
  static final headline1StyleInter = GoogleFonts.poppins(
      color: AppColors.white,
      fontSize: 20.sp, //34px
      fontWeight: FontWeight.w600);
  static final headline2StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 20.sp, //24px
      fontWeight: FontWeight.w600);
  static final headline3StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 16.sp, //20px
      fontWeight: FontWeight.w600);
  static final headline4StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 14.sp, //18px
      fontWeight: FontWeight.w600);
  static final headline5StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 14.sp, //all button style
      fontWeight: FontWeight.w600);

  // h medium
  static final headline6StyleInter = GoogleFonts.poppins(
      color: AppColors.white,
      fontSize: 12.sp, //34px
      fontWeight: FontWeight.w500);
  static final headline7StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 14.sp, //tabbar style text
      fontWeight: FontWeight.w500);
  static final headline8StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 8.sp, //used
      fontWeight: FontWeight.w500);
  static final headline9StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 16.sp, //Header-Style
      fontWeight: FontWeight.w500);
  static final headline10StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 14.sp, //used
      fontWeight: FontWeight.w500);

  // h regular    
  static final headline11StyleInter = GoogleFonts.poppins(
      color: AppColors.white,
      fontSize: 14.sp, //hinttext style
      fontWeight: FontWeight.w400);
  static final headline12StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 12.sp, //text label
      fontWeight: FontWeight.w400);
  static final headline13StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 8.sp, //card use
      fontWeight: FontWeight.w400);
  static final headline14StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 10.sp, //used 
      fontWeight: FontWeight.w400);
  static final headline15StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 12.sp, //used
      fontWeight: FontWeight.w400);

  // p regular    
  static final headline16StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 7.sp, //14px
      fontWeight: FontWeight.w400);
  // p medium    
  static final headline17StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 7.sp, //14px
      fontWeight: FontWeight.w500);
  
  // s medium
  static final headline18StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 7.sp, //12px
      fontWeight: FontWeight.w500);

  // s regular
  static final headline19StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 7.sp, //12px
      fontWeight: FontWeight.w400);

  // h2 semibold    
  static final headline20StyleInter = GoogleFonts.poppins(
      color: AppColors.appColor000000,
      fontSize: 7.sp, //30px
      fontWeight: FontWeight.w600);




  //old -----
  static final headline1StyleArial = TextStyle(
      fontFamily: "Arial",
      color: AppColors.appColorFFFFFF,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold);
  static final headline2StyleArial = TextStyle(
      fontFamily: "Arial",
      color: AppColors.appColorFFFFFF,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold);
  static final headline3StyleArial = TextStyle(
      fontFamily: "Arial",
      color: AppColors.appColorFFFFFF,
      fontSize: 10.sp,
      fontWeight: FontWeight.bold);
  static final headline4StyleArial = TextStyle(
      fontFamily: "Arial",
      color: AppColors.appColorFFFFFF,
      fontSize: 8.sp,
      fontWeight: FontWeight.bold);
}
