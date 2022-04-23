import 'package:flutter/material.dart';
import 'package:hausaufgaben/globals.dart';
import 'package:hausaufgaben/pages/homework/details.dart';

import '../../styling.dart';

class HistoryExamListView extends StatefulWidget {
  const HistoryExamListView({Key? key}) : super(key: key);

  @override
  State<HistoryExamListView> createState() => _HistoryExamListView();
}

class _HistoryExamListView extends State<HistoryExamListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(4.0),
        itemCount: historyDataList.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Hero(
              tag: 'title' + i.toString(),
              child: Text(
                historyDataList[i]['Subject'],
                style: AppTheme.textTheme.headline5,
              ),
            ),
            subtitle: Text(
              historyDataList[i]['Content'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.textTheme.subtitle1,
            ),
            trailing: const Icon(
              Icons.expand_more,
              color: Colors.black,
            ),
            tileColor: AppTheme.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)
            ),
            visualDensity: const VisualDensity(vertical: 4.0),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeworkDetailsPage(historyDataList[i]['Subject'], historyDataList[i]['Given'], historyDataList[i]['Content'], i)));
            },
          );
        },
      separatorBuilder: (context, index) => const SizedBox(
        height: 4,
      ),
    );
  }
}
