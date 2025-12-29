import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String text,
    Color? backgroundColor,
    TextStyle? textStyle,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColors.whiteColor,
       content: Text(
  text,
  style: textStyle ?? const TextStyle(color: AppColors.whiteColor),
),
backgroundColor: backgroundColor ?? AppColors.greenColor,
      )
    );
  }
}
