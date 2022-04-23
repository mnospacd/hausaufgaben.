import 'package:flutter/material.dart';
import 'package:hausaufgaben/pages/exams/appBar.dart';

import '../../styling.dart';
import '../../widgets/drawer.dart';
import 'body.dart';

class ExamPage extends StatelessWidget {
  static const String routeName = '/ExamPage';
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.notWhite,
        appBar: examAppBar(),
        body: examBody(),
        drawer: const NavigationDrawer(),
      ),
    );
  }
}
