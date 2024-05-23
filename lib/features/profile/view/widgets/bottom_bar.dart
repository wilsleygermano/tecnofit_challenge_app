import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/features/profile/entities/destination.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
      {super.key, required this.selectedIndex, this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      destinations: allDestinations.map((e) {
        return NavigationDestination(
          icon: Icon(e.icon),
          label: e.label,
        );
      }).toList(),
      onDestinationSelected: onDestinationSelected,
    );
  }
}
