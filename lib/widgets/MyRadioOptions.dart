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
    return isSelected ? Image.asset(selectedText,width: 40,): Image.asset(text,width: 40,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.teal.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 2),
            ],
          ),
        ),
      ),
    );
  }
}
