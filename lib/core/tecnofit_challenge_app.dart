import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/features/signin/view/page/signin_page.dart';

class TecnoFitChallengApp extends StatelessWidget {
  const TecnoFitChallengApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE9F2FF),
        ),
        useMaterial3: true,
        fontFamily: "Lato",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              const Color(0xFF6C63FF).withOpacity(0.4),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
      home: const SigninPage(),
    );
  }
}
