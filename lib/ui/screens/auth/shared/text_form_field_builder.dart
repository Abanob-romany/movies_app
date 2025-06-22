import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';

TextFormField buildTextFormField({
  required String hintText,
  required String icon,
  IconData? suffixIcon,
  required TextEditingController controller,
  bool obscureText = false,
  TextStyle? hintStyle,
  TextStyle? style,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    style: style ?? AppStyle.regular16White,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.gray,
      hintText: hintText,
      hintStyle: hintStyle ?? AppStyle.regular16White,
      prefixIcon: Image.asset(icon),
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.gray),
      ),
    ),
  );
}
