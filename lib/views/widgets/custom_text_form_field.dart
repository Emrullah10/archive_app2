import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputType keyboardType;
  final Color backgroundColor;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: isObscure,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
    );
  }
}
