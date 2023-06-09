import 'package:flutter/material.dart';
import 'package:namr/providers/provider.dart';
import 'package:provider/provider.dart';

import '../utilities/bottom_tab.dart';
import '../utilities/navigation_rails.dart';
import 'favourites.dart';
import 'generator_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    List<Widget> widgets = [
      GeneratorPage(),
      FavouriteWidget(),
    ];

    return LayoutBuilder(
      builder: (context, constraint) {
        print(appState);
        return Scaffold(
          body: Row(
            children: [
              if (constraint.maxWidth > 400)
                NavigationLarge(appState: appState, constraint: constraint),
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Container(
                    key: ValueKey<int>(appState.selectedValue),
                    color: Theme.of(context).colorScheme.background,
                    child: widgets[appState.selectedValue],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: constraint.maxWidth <= 400 ? BottomTab() : null,
        );
      },
    );
  }
}
