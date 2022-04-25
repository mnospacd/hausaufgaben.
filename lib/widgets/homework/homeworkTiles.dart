import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hausaufgaben/globals.dart';
import 'package:hausaufgaben/components/localStorage.dart';

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
    return RefreshIndicator(
      color: AppTheme.greyGreen,
      onRefresh: () async {
        Future.wait([ReloadData()]);
        setState(() {});
      },
      child: ListView.separated(
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
              child: Hero(
                tag: 'tile' + i.toString(),
                child: Material(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeworkDetailsPage(homeworkDataList[i]['Subject'], homeworkDataList[i]['Given'], homeworkDataList[i]['Content'], i)));
                      },
                  ),
                ),
              ),
            );
          },
        separatorBuilder: (context, index) => const SizedBox(
          height: 4,
        ),
      ),
    );
  }

  Future<String> ReloadData() async {
    CollectionReference homework = FirebaseFirestore.instance.collection('homework');
    //get homework

    //get all docs from collection
    QuerySnapshot querySnapshot = await homework.get();

    // get data and convert to list
    final _homeworkDataList = querySnapshot.docs.map((doc) => doc.data()).toList();

    List<String> localUuids = [];

    homeworkDataList = _homeworkDataList;

    for (var i = 0; i < _homeworkDataList.length; i++) {
      localUuids.add(homeworkDataList[i]['Id']);
    }

    _check(localUuids);

    //history
    CollectionReference history = FirebaseFirestore.instance.collection('history');

    QuerySnapshot historyQuerySnapshot = await history.get();

    final _historyDataList = historyQuerySnapshot.docs.map((doc) => doc.data()).toList();

    historyDataList = _historyDataList;

    setState(() {});

    return Future.value('Data successfully pulled.');
  }

  void _check(localUuids) {
    if (localStorage.instance.getStringList('homeworkUuids') == null) {
      localStorage.instance.setStringList('homeworkUuids', []);
    }
    if (localStorage.instance.getStringList('doneHomeworkUuids') == null) {
      localStorage.instance.setStringList('doneHomeworkUuids', []);
    }

    List<String>? uuids = localStorage.instance.getStringList('homeworkUuids');

    List<String>? doneUuids = localStorage.instance.getStringList(
        'doneHomeworkUuids');

    for (var i = 0; i < localUuids.length; i++) {
      if (uuids?.contains(localUuids[i]) == false) {
        //check if homework is marked as 'done'
        if (doneUuids?.contains(localUuids[i]) == true) {
          homeworkDataList.removeWhere((element) =>
          element['Id'] == localUuids[i]);
        }
      }
    }
  }
}
