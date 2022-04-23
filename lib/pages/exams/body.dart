import 'package:flutter/material.dart';
import 'package:hausaufgaben/widgets/exam/historyHomeworkTiles.dart';

import '../../widgets/exam/homeworkTiles.dart';

Widget examBody() {
  return const TabBarView(
    children: [
      ExamListView(),
      HistoryExamListView()
    ],
  );
}