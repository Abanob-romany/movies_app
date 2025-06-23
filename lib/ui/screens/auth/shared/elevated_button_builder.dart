import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_styles.dart';

ElevatedButton buildElevatedButton({
  required String text,
  required VoidCallback onPressed,
  TextStyle? style,
  Color? backgroundColor,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    child: Text(text, style: style ?? AppStyle.regular20black),
  );
}
