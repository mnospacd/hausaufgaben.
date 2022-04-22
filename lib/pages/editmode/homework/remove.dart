import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hausaufgaben/globals.dart';

import '../../../styling.dart';

class EditHomeworkRemove extends StatefulWidget {
  const EditHomeworkRemove({Key? key}) : super(key: key);

  @override
  State<EditHomeworkRemove> createState() => _EditHomeworkRemoveState();
}

class _EditHomeworkRemoveState extends State<EditHomeworkRemove> {
  CollectionReference homework = FirebaseFirestore.instance.collection('homework');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(4.0),
        itemCount: homeworkDataList.length,
        itemBuilder: (context, i) {
          return ListTile(
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
            onTap: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Hausaufgabe entfernt. App muss neugestart werden, um ein Effekt zu sehen.',
                      style: TextStyle(
                          fontFamily: 'Inter'
                      ),
                    ),
                  )
              );
              homework.doc(homeworkDataList[i]['Id']).delete();
              setState(() {
                homeworkDataList.removeAt(i);
              });
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 4,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppTheme.greyDarkGreen,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppTheme.greyDarkGreen
        ),
        title: Text(
          'Entferne Hausaufgabe',
          style: AppTheme.textTheme.headline6,
        ),
      ),
    );
  }
}
