import 'package:flutter/material.dart';
import 'package:hausaufgaben/globals.dart';

import '../../components/firebase/get_data.dart';
import '../../pages/homework/details.dart';
import '../../styling.dart';

class homeworkListView extends StatefulWidget {
  const homeworkListView({Key? key}) : super(key: key);

  @override
  State<homeworkListView> createState() => _homeworkListViewState();
}

class _homeworkListViewState extends State<homeworkListView> {
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
              title: Hero(
                tag: "title" + i.toString(),
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    homeworkDataList[i]['Subject'],
                    style: AppTheme.textTheme.headline5,
                  ),
                ),
              ),
              subtitle: Hero(
                tag: 'subtitle' + i.toString(),
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    homeworkDataList[i]['Content'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.textTheme.subtitle1,
                  ),
                ),
              ),
              trailing: Hero(
                tag: 'icon' + i.toString(),
                child: const Material(
                  type: MaterialType.transparency,
                  child: Icon(
                    Icons.expand_more,
                    color: Colors.black,
                  ),
                ),
              ),
              tileColor: AppTheme.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)
              ),
              visualDensity: const VisualDensity(vertical: 4.0),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeworkDetailsPage(homeworkDataList[i]['Subject'], homeworkDataList[i]['Given'], homeworkDataList[i]['Content'], i)));
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
