import 'package:hausaufgaben/pages/editmode/redirect.dart';
import 'package:hausaufgaben/pages/homework/page.dart';
import 'package:hausaufgaben/pages/timetable/page.dart';

class PageRoutes {
  static String currentRoute = homework;

  static const String homework = HomeworkPage.routeName;
  static const String timetable = TimetablePage.routeName;
  static const String edit = AuthenticationWrapper.routeName;
}