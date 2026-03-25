import 'package:flutter/material.dart';
import 'package:my_app/Core/Const/App_Color.dart';

class CustomUserTxtField extends StatelessWidget {
  const CustomUserTxtField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.autofocus,
    this.validator,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool autofocus;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        autofocus: autofocus,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.access_time),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
          fillColor: AppColors.textfieldcolor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
