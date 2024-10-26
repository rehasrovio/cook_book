import 'package:cook_book/src/configs/validations/form_input_validations.dart';
import 'package:cook_book/src/ui_kit/text_input_fields/custom_text_input.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextInput(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            validators: [
              validateRequired(),
              validateEmail(),
            ],
          ),
          const SizedBox(height: 16.0),
          CustomTextInput(
            controller: passwordController,
            obscureText: true,
            labelText: 'Password',
            validators: [validateRequired()],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Handle sign-in logic here
                // ...
              }
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
