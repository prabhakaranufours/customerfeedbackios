import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.placeholder,
      this.suffixIcon,
      required this.prefixIcon,
      this.contentPadding,
      this.maxLines,
      this.squareInput = true,
      this.readOnly = false,
      required this.controller,
      this.obscureText = false,
      this.fillColor,
      this.onChanged,
      this.keyboardType,
      this.maxLength,
      this.textInputAction,
      this.onSubmitted,
      this.validator});

  final void Function(String)? onChanged;
  final Function? onSubmitted;
  final String? Function(String?)? validator;
  final bool squareInput;
  final bool readOnly;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final String placeholder;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final EdgeInsets? contentPadding;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      readOnly: this.readOnly,
      maxLines: this.maxLines ?? 1,
      obscureText: this.obscureText,
      onChanged: this.onChanged,
      keyboardType: this.keyboardType,
      maxLength: this.maxLength,
      textInputAction: this.textInputAction ?? TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        fillColor: this.fillColor ?? Colors.transparent,
        hintText: this.placeholder,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: this.contentPadding != null
            ? this.contentPadding
            : EdgeInsets.all(12),
        suffixIcon: this.suffixIcon,
        prefixIcon: this.prefixIcon,
      ),
    );
  }
}

//For CovidQAForm
class CustomTextField1 extends StatelessWidget {
  CustomTextField1(
      {required this.placeholder,
      this.suffixIcon,
      required this.prefixIcon,
      this.contentPadding,
      this.maxLines,
      this.squareInput = true,
      this.readOnly = false,
      required this.controller,
      this.obscureText = false,
      this.fillColor,
      this.onChanged,
      this.keyboardType,
      this.maxLength,
      this.textInputAction,
      this.onSubmitted,
      this.validator});

  final Function(String?)? onChanged;
  final Function? onSubmitted;
  final String? Function(String?)? validator;
  final bool squareInput;
  final bool readOnly;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final String placeholder;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final EdgeInsets? contentPadding;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      readOnly: this.readOnly,
      maxLines: this.maxLines ?? 1,
      obscureText: this.obscureText,
      onChanged: this.onChanged,
      keyboardType: this.keyboardType,
      maxLength: this.maxLength,
      textInputAction: this.textInputAction ?? TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        fillColor: this.fillColor ?? Colors.transparent,
        hintText: this.placeholder,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: this.contentPadding != null
            ? this.contentPadding
            : EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        suffixIcon: this.suffixIcon,
        prefixIcon: this.prefixIcon,
      ),
    );
  }
}
