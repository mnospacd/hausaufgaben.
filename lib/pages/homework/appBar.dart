import 'package:flutter/material.dart';

import '../../styling.dart';

AppBar homescreenAppBar() {
  return AppBar(
    backgroundColor: AppTheme.greyDarkGreen,
    title: Text(
      'Hausaufgaben',
      style: AppTheme.textTheme.headline6,
    ),
    bottom: const TabBar(
      indicatorColor: AppTheme.white,
      tabs: [
        Tab(icon: Icon(Icons.library_books)),
        Tab(icon: Icon(Icons.history))
      ],
    ),
  );
}