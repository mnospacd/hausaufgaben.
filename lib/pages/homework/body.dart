import 'package:flutter/material.dart';
import 'package:hausaufgaben/widgets/historyHomeworkTiles.dart';
import 'package:hausaufgaben/widgets/homeworkTiles.dart';

Widget homeworkBody() {
  return const TabBarView(
    children: [
      homeworkListView(),
      historyHomeworkListView()
    ],
  );
}