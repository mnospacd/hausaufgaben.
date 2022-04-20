import 'package:flutter/material.dart';
import 'package:hausaufgaben/styling.dart';
import 'package:hausaufgaben/widgets/drawer/drawerHeader.dart';
import 'package:hausaufgaben/widgets/drawer/drawerListTile.dart';

import '../routes/pageRoute.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
      child: Drawer(
        backgroundColor: AppTheme.greyDarkGreen,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            NavigationDrawerHeader(),
            NavigationDrawerTile(context, 'homework'),
            NavigationDrawerTile(context, 'timetable'),
            NavigationDrawerTile(context, 'resetUuids')
          ],
        ),
      ),
    );
  }
}

