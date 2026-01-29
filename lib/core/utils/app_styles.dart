import 'package:flutter/material.dart';
import '../helper/font_family_helper.dart';
import '../helper/font_weight_helper.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle font30semiBoldGravitasOne = TextStyle(
    fontSize: 30,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primaryColor,
    fontFamily: FontFamilyHelper.gravitasOne,
  );
  static TextStyle font18regularPoppins = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.primaryColor,
    fontFamily: FontFamilyHelper.poppins,
  );
  static TextStyle font30boldOleoScript = TextStyle(
    fontSize: 30,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
    fontFamily: FontFamilyHelper.oleoScript,
  );
  static TextStyle font16mediumPoppins = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black45,
    fontFamily: FontFamilyHelper.poppins,
  );
  static TextStyle font16regularPoppins = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.poppins,
  );
  static TextStyle font14regularPoppins = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.poppins,
  );
  static TextStyle font14mediumPoppins = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.poppins,
  );
  static TextStyle font19boldPoppins = TextStyle(
    fontSize: 19,
    color: AppColors.white,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14extraBoldPoppins = TextStyle(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font12mediumPoppins = TextStyle(
    fontSize: 12,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13boldPoppins = TextStyle(
    fontSize: 13,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font25boldPoppins = TextStyle(
    fontSize: 25,
    color: AppColors.white,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font28boldPoppins = TextStyle(
    fontSize: 28,
    color: AppColors.white,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20mediumPoppins = TextStyle(
    fontSize: 20,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.poppins,
    fontWeight: FontWeightHelper.medium,
  );
}
