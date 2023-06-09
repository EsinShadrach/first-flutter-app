import 'package:flutter/material.dart';
import 'package:namr/providers/provider.dart';
import 'package:provider/provider.dart';

class FavouriteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var appState = context.watch<MyAppState>();
    if (appState.favourite.isEmpty) {
      return Center(
        child: Text("No Favourites Yet", style: theme.textTheme.displaySmall!),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        for (var pair in appState.favourite)
          Card(
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: theme.colorScheme.primary,
              ),
              title: Text(pair.asLowerCase),
              iconColor: theme.colorScheme.secondary,
              onLongPress: () {
                appState.removeItem(pair);
              },
            ),
          ),
      ],
    );
  }
}