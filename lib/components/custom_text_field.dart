import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextStyle? textStyle;

  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    super.key,
    this.textStyle,
  });

  String? get text => null;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, // Color de fondo del botón
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text!,
        style: textStyle ??
            const TextStyle(color: Colors.white), // Aplicar el estilo de texto
      ),
    );
  }
}
