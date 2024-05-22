import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/core/constants/app_strings.dart';

class MockTextField extends StatelessWidget {
  const MockTextField({
    super.key,
    required this.text,
    required this.isPassword,
  });

  const MockTextField.email({
    super.key,
    this.text = AppStrings.mockMail,
    this.isPassword = false,
  });

  const MockTextField.password({
    super.key,
    this.text = "somesupersecretpassword",
    this.isPassword = true,
  });
  final String text;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: TextEditingController(text: text),
        ignorePointers: true,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
