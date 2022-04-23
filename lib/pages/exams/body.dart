import 'package:flutter/material.dart';
import 'package:hausaufgaben/widgets/exam/exam_history_tiles.dart';

import '../../widgets/exam/exam_tiles.dart';

Widget examBody() {
  return const TabBarView(
    children: [
      ExamListView(),
      HistoryExamListView()
    ],
  );
}