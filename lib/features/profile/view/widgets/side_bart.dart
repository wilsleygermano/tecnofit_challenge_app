import 'package:flutter/material.dart';
import 'package:tecnofit_challenge_app/features/profile/entities/destination.dart';

class SideBar extends StatelessWidget {
  const SideBar(
      {super.key, required this.selectedIndex, this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      destinations: allDestinations.map((e) {
        return NavigationRailDestination(
          icon: Icon(e.icon),
          label: Text(e.label),
        );
      }).toList(),
      onDestinationSelected: onDestinationSelected,
    );
  }
}
