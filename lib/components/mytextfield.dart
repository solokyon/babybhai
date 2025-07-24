import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final String hintText;
  final bool autoFocus;
  final TextEditingController controller;
  final bool readOnly;

  const Mytextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.autoFocus = false,
    this.readOnly = false
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText
      ),
    );
  }
}