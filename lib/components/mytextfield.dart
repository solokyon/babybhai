import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final String hintText;
  final bool autoFocus;
  final TextEditingController controller;

  const Mytextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.autoFocus = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText
      ),
    );
  }
}