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
          seedColor: const Color(0XFFf9f9f9),
          surface: const Color(0XFFf9f9f9),
        ),
        useMaterial3: true,
        fontFamily: "Lato",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(
              Color(0xFF89CFF0),
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
