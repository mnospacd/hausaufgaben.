import 'package:flutter/material.dart';
import 'package:hausaufgaben/widgets/homework/historyHomeworkTiles.dart';
import 'package:hausaufgaben/widgets/homework/homeworkTiles.dart';

Widget homeworkBody() {
  return const TabBarView(
    children: [
      homeworkListView(),
      historyHomeworkListView()
    ],
  );
}