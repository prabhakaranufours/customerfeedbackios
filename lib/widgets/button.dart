import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({

    required this.buttonText,
    required this.onPressed,
    this.buttonType = ButtonType.primary,
    this.smallText = false,
    this.width,
    this.margin,
    this.padding,
    this.textSize,
    this.height,
    this.borderColor = Colors.white,
  });

  final String buttonText;
  final ButtonType buttonType;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final void Function()? onPressed;
  final bool smallText;
  final double? textSize;
  final double? height;
  final Color borderColor;

  Color _buttonColor(BuildContext context) {
    if (this.buttonType == ButtonType.primary) {
      return Colors.black;
    }

    if (this.buttonType == ButtonType.secondary) {
      return Theme.of(context).primaryColor;
    }

    if (this.buttonType == ButtonType.third) {
      return Colors.white;
    }
    return primary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: this.padding,
      height: this.height ?? 55,
      width: this.width ?? MediaQuery.of(context).size.width * 1,
      child: RaisedButton(
        elevation: 7,
        child: Text(
          this.buttonText,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: this.buttonType == ButtonType.primary ? primary : this.buttonType == ButtonType.third ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: this.textSize != null
                ? this.textSize
                : this.smallText ? 14 : 17,
          ),
        ),
        onPressed: this.onPressed,
        color: _buttonColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
  third
}