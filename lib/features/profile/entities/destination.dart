import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.icon, required this.label});
  final IconData icon;
  final String label;
}

const List<Destination> allDestinations = <Destination>[
  Destination(icon: Icons.home, label: 'Home'),
  Destination(icon: Icons.search, label: 'Search'),
  Destination(icon: Icons.add, label: 'Add'),
  Destination(icon: Icons.favorite, label: 'Favorite'),
  Destination(icon: Icons.contact_mail, label: 'Contact'),
];
