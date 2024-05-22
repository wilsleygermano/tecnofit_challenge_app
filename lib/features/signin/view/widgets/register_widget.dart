import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    super.key,
    required this.isDesktop,
    required this.children,

  });

  final bool isDesktop;
  final List<Widget> children;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late bool _isDesktop;


  void _init() {
    _isDesktop = widget.isDesktop;

  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant RegisterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDesktop != widget.isDesktop) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isDesktop
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.children,
          );
  }
}
