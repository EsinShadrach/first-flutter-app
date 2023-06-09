import 'package:flutter/material.dart';
import 'package:namr/providers/provider.dart';
import 'package:provider/provider.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});
  @override
  State<BottomTab> createState() => BottomTabState();
}

class BottomTabState extends State<BottomTab> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    IconData homeIcon;
    IconData favouriteIcon;

    if (appState.selectedValue == 0) {
      homeIcon = Icons.home_rounded;
      favouriteIcon = Icons.favorite_outline_rounded;
    } else if (appState.selectedValue == 1) {
      homeIcon = Icons.home_outlined;
      favouriteIcon = Icons.favorite_rounded;
    } else {
      throw UnimplementedError(
        "No Widget Assigned for ${appState.selectedValue}",
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: TabBar(
        labelColor: Theme.of(context).colorScheme.onPrimary,
        unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
        indicatorColor: Theme.of(context).colorScheme.onPrimary,
        indicatorWeight: 3.0,
        controller: _tabController,
        onTap: (value) {
          setState(() {
            appState.setTabValue(value);
          });
          print(appState.selectedValue);
        },
        tabs: [
          Tab(
            icon: Icon(homeIcon),
            iconMargin: EdgeInsets.all(0),
            text: 'Home',
            height: 50,
          ),
          Tab(
            icon: Icon(favouriteIcon),
            iconMargin: EdgeInsets.all(0),
            text: 'Favourite',
            height: 50,
          ),
        ],
      ),
    );
  }
}
