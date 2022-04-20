import 'package:flutter/material.dart';

import '../../styling.dart';
import '../../widgets/drawer.dart';

class TimetablePage extends StatelessWidget {
  static const String routeName = '/TimetablePage';
  const TimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your mOm 2'),
        backgroundColor: AppTheme.greyDarkGreen,
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
