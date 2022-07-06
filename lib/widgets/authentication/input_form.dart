import 'package:flutter/material.dart';

class InputFieldBuilder extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final String hint;
  final TextAlign? textAlign;
  final int? maxLength;
  final String? Function(String?)? validator;
  const InputFieldBuilder({
    Key? key,
    required this.controller,
    required this.hint,
    this.inputType,
    this.maxLength,
    this.textAlign,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: "",
          hintText: hint,
        ),
        validator: validator,
      ),
    );
  }
}
