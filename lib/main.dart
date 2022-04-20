import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hausaufgaben/pages/homework/page.dart';
import 'package:hausaufgaben/pages/index.dart';
import 'package:hausaufgaben/pages/timetable/page.dart';
import 'package:hausaufgaben/routes/pageRoute.dart';
import 'package:hausaufgaben/styling.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //canvasColor: Colors.transparent,
        accentColor: AppTheme.greyGreen
      ),
      title: 'hausaufgaben.',
      home: IndexPage(),
      routes: {
        PageRoutes.homework: (context) => const HomeworkPage(),
        PageRoutes.timetable: (context) => const TimetablePage()
      },
    );
  }
}