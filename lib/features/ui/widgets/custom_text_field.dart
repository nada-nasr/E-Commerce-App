import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  Color? filledColor;
  Color? borderColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardInputType;
  bool? obscureText;
  bool? isPassword;
  TextStyle? textStyle;
  bool? readonly;

  CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.borderColor,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.keyboardInputType,
    this.obscureText,
    this.textStyle,
    this.filledColor = AppColors.whiteColor,
    this.isPassword = false,
    this.readonly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle ?? TextStyle(color: AppColors.hintTextColor),
      maxLines: maxLines ?? 1,
      keyboardType: keyboardInputType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      controller: controller,
      validator: validator,
      cursorColor: AppColors.whiteColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.whiteColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.whiteColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? AppStyles.light18HintText,
        labelStyle: labelStyle ?? AppStyles.light18HintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: filledColor,
      ),
    );
  }
}
