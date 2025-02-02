import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // flutter_screenutil ekledim

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r), // Esnek border radius
        ),
      ),
      obscureText: isObscure,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
    );
  }
}
