import 'package:flutter/material.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final String selectedText;
  final ValueChanged<T?> onChanged;


  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.selectedText,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;
    return isSelected ? Image.asset(selectedText,width: 45,): Image.asset(text,width: 45,);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      splashColor: Colors.amber.withOpacity(0.1),
      child: _buildLabel(),
    );
  }
}
