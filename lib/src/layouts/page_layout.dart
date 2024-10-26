import 'package:flutter/material.dart';

class CustomPageLayout extends StatelessWidget {
  const CustomPageLayout({super.key, required this.body});

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
