import 'package:cook_book/src/features/auth/presentation/forms/sign_in_form.dart';
import 'package:cook_book/src/layouts/page_layout.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPageLayout(
      body: SignInPageView(),
    );
  }
}

class SignInPageView extends StatefulWidget {
  const SignInPageView({super.key});

  @override
  State<SignInPageView> createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  final signInFormKey = GlobalKey<FormState>();
  late TextEditingController userEmailInputController;
  late TextEditingController userPasswordInputController;

  @override
  void initState() {
    userEmailInputController = TextEditingController();
    userPasswordInputController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    userEmailInputController.dispose();
    userPasswordInputController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SignInForm(
        formKey: signInFormKey,
        passwordController: userPasswordInputController,
        emailController: userEmailInputController,
      ),
    );
  }
}
