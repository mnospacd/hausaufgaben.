import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styling.dart';

AppBar examAppBar() {
  return AppBar(
    backgroundColor: AppTheme.greyDarkGreen,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppTheme.greyDarkGreen
    ),
    title: Text(
      'Arbeiten',
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