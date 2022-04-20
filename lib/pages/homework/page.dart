import 'package:flutter/material.dart';
import 'package:hausaufgaben/pages/homework/appBar.dart';

import '../../styling.dart';
import '../../widgets/drawer.dart';
import 'body.dart';

class HomeworkPage extends StatelessWidget {
  static const String routeName = '/HomeworkPage';
  const HomeworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.notWhite,
        appBar: homescreenAppBar(),
        body: homeworkBody(),
        drawer: const NavigationDrawer(),
      ),
    );
  }
}
