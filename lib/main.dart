import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/core/locator/setup_app_locator.dart';
import 'package:tecnofit_challenge_app/core/tecnofit_challenge_app.dart';

void main() {
  setupAppLocator();
  runApp(const TecnoFitChallengApp());
}
