import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecnofit_challenge_app/core/constants/assets.dart';

class GenericSigninImage extends StatelessWidget {
  const GenericSigninImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blueGrey.withOpacity(0.1),
          ),
          child: SvgPicture.asset(
            Assets.signinImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
