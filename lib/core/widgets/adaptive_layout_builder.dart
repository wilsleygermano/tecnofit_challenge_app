import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/core/widgets/adaptive_axis_widget.dart';

class AdaptiveLayoutBuilder extends StatelessWidget {
  const AdaptiveLayoutBuilder({
    super.key,
    required this.children,
    required this.screen,
  });

  const AdaptiveLayoutBuilder.signin({
    super.key,
    required this.children,
    this.screen = AppScreens.signin,
  });

  const AdaptiveLayoutBuilder.profile({
    super.key,
    required this.children,
    this.screen = AppScreens.profile,
  });

  final List<Widget> children;
  final AppScreens screen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return AdaptiveAxisWidget(
          isDesktop: constraints.maxWidth > 600,
          screen: screen,
          children: children,
        );
      }),
    );
  }
}
