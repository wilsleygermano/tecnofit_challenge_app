import 'package:flutter/material.dart';

class AdaptiveAxisWidget extends StatefulWidget {
  const AdaptiveAxisWidget({
    super.key,
    required this.isDesktop,
    required this.children,
    this.scrollController,
    required this.screen,
  });

  final bool isDesktop;
  final List<Widget> children;
  final ScrollController? scrollController;
  final AppScreens screen;

  @override
  State<AdaptiveAxisWidget> createState() => _AdaptiveAxisWidgetState();
}

class _AdaptiveAxisWidgetState extends State<AdaptiveAxisWidget> {
  late bool _isDesktop;
  late AppScreens _screen;

  void _init() {
    _isDesktop = widget.isDesktop;
    _screen = widget.screen;
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant AdaptiveAxisWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDesktop != widget.isDesktop ||
        oldWidget.screen != widget.screen) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isDesktop
        ? Row(
            children: widget.children,
          )
        : _screen == AppScreens.signin
            ? Column(
                children: widget.children,
              )
            : ListView(
                shrinkWrap: true,
                controller: widget.scrollController,
                physics: const BouncingScrollPhysics(),
                children: widget.children,
              );
  }
}

enum AppScreens {
  signin,
  profile,
}
