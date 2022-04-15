import 'package:flutter/material.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    required this.labelText,
    required this.showIcon,
    required this.keyboardType,
    this.icon,
    required this.controller,
    required this.onSaved,
    required this.validator,
  });

  final String labelText;
  final bool showIcon;
  final TextInputType keyboardType;
  final IconData? icon;
  final TextEditingController controller;
  final void Function(String?) onSaved;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            style: textStyle,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: textColor.withOpacity(0.5),
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: textColor.withOpacity(0.5),
                  width: 1.0,
                ),
              ),
              labelText: labelText,
              labelStyle: textStyle,
              prefixIcon: Icon(
                icon,
                color: textColor,
              ),
            ),
            keyboardType: keyboardType,
            controller: controller,
            onSaved: onSaved,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
