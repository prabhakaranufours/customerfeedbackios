import 'package:flutter/material.dart';

class BoxEditText extends StatelessWidget {
  String placeholder;
  Widget? suffixIcon;
  Widget? prefixIcon;
  EdgeInsets? contentPadding;
  int? maxLines, maxLength;
  bool squareInput, readOnly, obsecureText;
  TextEditingController? controller;
  Color? fillColor;
  Color? borderColor;
  Function(String)? onChanged, onSubmitted, validator;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  double? width;

  BoxEditText(
      {Key? key,
      required this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.contentPadding,
      this.maxLines,
      this.squareInput = true,
      this.readOnly = false,
      this.controller,
      this.obsecureText = false,
      this.fillColor,
      this.onChanged,
      this.keyboardType,
      this.maxLength,
      this.textInputAction,
      this.onSubmitted,
      this.validator,
      this.borderColor,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: borderColor== null ? null : Border.all(color: borderColor!),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 0.5),
          ]),
      child: TextFormField(
        key: key,
          controller: controller,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: keyboardType,
          obscureText: obsecureText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          onChanged: onChanged,
          readOnly: readOnly,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            filled: false,
            counterText: '',
            counter: null,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: const TextStyle(fontSize: 15),
            contentPadding: const EdgeInsets.all(12),
          )),
    );
  }
}
