import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  Function()? onPressed;
  Color? buttonColor;
  Color? textColor;
  bool smallText;
  double? width, height, textSize;
  EdgeInsets? margin, padding;
  Widget? icon;
  bool isLoading;

  CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.smallText = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textSize,
    this.icon,
    this.textColor,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox(
        height: 35,
        child: CircularProgressIndicator())
        : Container(
            margin: margin,
            padding: padding,
            height: height ?? 35,
            width: width ?? MediaQuery.of(context).size.width * 1,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  primary: buttonColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    icon != null
                        ? const SizedBox(
                            width: 8,
                          )
                        : const SizedBox.shrink(),
                    Text(
                      buttonText,
                      style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: textSize ?? (smallText ? 13 : 15)),
                    ),
                  ],
                )),
          );
  }
}
