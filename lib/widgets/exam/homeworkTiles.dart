import 'package:flutter/material.dart';
import 'package:hausaufgaben/globals.dart';

import '../../components/firebase/get_data.dart';
import '../../pages/homework/details.dart';
import '../../styling.dart';

class ExamListView extends StatefulWidget {
  const ExamListView({Key? key}) : super(key: key);

  @override
  State<ExamListView> createState() => _ExamListViewState();
}

class _ExamListViewState extends State<ExamListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(4.0),
        itemCount: homeworkDataList.length,
        itemBuilder: (context, i) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
            background: Container(
              padding: const EdgeInsets.all(18),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), bottomLeft: Radius.circular(16.0)),
                  color: AppTheme.greyLightGreen
              ),
              child: const Icon(
                Icons.check,
                color: AppTheme.white,
                size: 32.0,
              ),
            ),
            key: ValueKey(homeworkDataList[i]),
            onDismissed: (direction) {
              setDone(homeworkDataList[i]['Id']);
              setState(() {
                homeworkDataList.removeAt(i);
              });
            },
            child: ListTile(
              title: Text(
                homeworkDataList[i]['Subject'],
                style: AppTheme.textTheme.headline5,
              ),
              subtitle: Text(
                homeworkDataList[i]['Content'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.textTheme.subtitle1,
              ),
              tileColor: AppTheme.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)
              ),
              visualDensity: const VisualDensity(vertical: 4.0),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeworkDetailsPage(homeworkDataList[i]['Subject'], homeworkDataList[i]['Given'], homeworkDataList[i]['Content'])));
                },
            ),
          );
        },
      separatorBuilder: (context, index) => const SizedBox(
        height: 4,
      ),
    );
  }
}
