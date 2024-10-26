import 'package:cook_book/src/configs/validations/form_input_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required this.validators,
    this.controller,
    this.onSaved,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController? controller;
  final List<String? Function(String?)> validators;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    final composedValidators = composeValidations(validators);

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: composedValidators,
      obscureText: obscureText,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
