import 'package:flutter/material.dart';
import 'package:namr/providers/provider.dart';

class NavigationLarge extends StatefulWidget {
  const NavigationLarge(
      {super.key, required this.constraint, required this.appState});
  final BoxConstraints constraint;
  final MyAppState appState;

  @override
  State<NavigationLarge> createState() => _NavigationLargeState();
}

class _NavigationLargeState extends State<NavigationLarge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationRail(
        extended: widget.constraint.maxWidth >= 600,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.favorite),
            label: Text('Favorites'),
          ),
        ],
        selectedIndex: widget.appState.selectedValue,
        onDestinationSelected: (value) {
          setState(() {
            widget.appState.setTabValue(value);
          });
        },
      ),
    );
  }
}
