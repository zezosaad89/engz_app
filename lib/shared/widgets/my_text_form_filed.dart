import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final int? maxLines;
  final int? minLines;
  final Icon? icon;
  final TextEditingController controller;
  final bool readonly;
  final ontap;
  final TextInputType? keyboardType;
  MyTextField({
    required this.controller,
    this.keyboardType,
    this.readonly = false,
    this.ontap,
    this.label,
    this.maxLines = 1,
    this.minLines = 1,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black87),
      readOnly: readonly,
      keyboardType: keyboardType,
      onTap: ontap,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon == null ? null : icon,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black45),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
