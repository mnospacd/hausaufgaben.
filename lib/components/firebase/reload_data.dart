import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hausaufgaben/globals.dart';

import '../localStorage.dart';

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