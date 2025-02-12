import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final TextEditingController controller;
  final Widget? suffixIcon; // Suffix icon için eklenen parametre

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = Colors.white,
    this.suffixIcon, // Varsayılan null
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r), // Esnek border radius
        ),
        suffixIcon: suffixIcon, // Suffix icon ekleniyor
      ),
    );
  }
}
