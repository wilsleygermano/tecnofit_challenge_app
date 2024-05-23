import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.leading,
  });
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color(0XFFf9f9f9),
      title: Text(title),
      titleTextStyle: titleTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      leading: leading,
    );
  }
}
