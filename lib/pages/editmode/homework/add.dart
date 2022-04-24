import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../../../styling.dart';

class EditHomeworkAdd extends StatefulWidget {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController givenController = TextEditingController();

  EditHomeworkAdd({Key? key}) : super(key: key);

  @override
  State<EditHomeworkAdd> createState() => _EditHomeworkAddState();
}

class _EditHomeworkAddState extends State<EditHomeworkAdd> {
  //add to history
  bool? _noHistory = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference homework = FirebaseFirestore.instance.collection('homework');
    CollectionReference history = FirebaseFirestore.instance.collection('history');

    //uuid stuff
    var uuid = const Uuid();
    String homeworkUuid = uuid.v4();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.greyDarkGreen,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppTheme.greyDarkGreen
          ),
          title: Text(
            'Hinzufüge Hausaufgabe',
            style: AppTheme.textTheme.headline6,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              controller: widget.subjectController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              autocorrect: false,
              cursorColor: AppTheme.greyGreen,
              style: const TextStyle(
                  fontFamily: 'Inter'
              ),
              decoration: const InputDecoration(
                labelText: "Fach",
                labelStyle: TextStyle(
                    color: AppTheme.greyGreen,
                    fontFamily: 'Inter'
                ),
                helperMaxLines: 3,
                helperText: "Bitte den Kurznamen für das Fach benutzen, zB. Mathematik => Mathe.",
                helperStyle: TextStyle(
                    fontFamily: 'Inter'
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.greyGreen),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.greyGreen),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: widget.contentController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                autocorrect: false,
                cursorColor: AppTheme.greyGreen,
                style: const TextStyle(
                    fontFamily: 'Inter'
                ),
                decoration: const InputDecoration(
                  labelText: "Inhalt",
                  labelStyle: TextStyle(
                      color: AppTheme.greyGreen,
                      fontFamily: 'Inter'
                  ),
                  helperMaxLines: 3,
                  helperText: "Den Inhalt bitte nicht zu lange machen, am besten einfach direkt von der Tafel abschreiben.",
                  helperStyle: TextStyle(
                      fontFamily: 'Inter'
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.greyGreen),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.greyGreen),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: widget.givenController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                autocorrect: false,
                cursorColor: AppTheme.greyGreen,
                style: const TextStyle(
                    fontFamily: 'Inter'
                ),
                decoration: const InputDecoration(
                  labelText: "Aufgegeben",
                  labelStyle: TextStyle(
                      color: AppTheme.greyGreen,
                      fontFamily: 'Inter'
                  ),
                  helperMaxLines: 3,
                  helperText: "Hier kommt das Datum wann es aufgegeben wurde. Es folgt nach diesem Beispiel: Mo, 21. August (Kurztag, Nummer. Monat).",
                  helperStyle: TextStyle(
                      fontFamily: 'Inter'
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.greyGreen),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.greyGreen),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CheckboxListTile(
                title: Text(
                    'Hinzufüge Hausaufgabe nicht zur Historie',
                    style: AppTheme.textTheme.bodyText1?.copyWith(fontSize: 16)
                ),
                value: _noHistory,
                onChanged: (bool? newValue) {
                  setState(() {
                    _noHistory = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ListTile(
                title: Text(
                    homeworkUuid,
                    style: AppTheme.textTheme.bodyText1?.copyWith(fontSize: 16)
                ),
                subtitle: const Text(
                  'Das ist eine UUID um Hausaufgaben zu identifizieren.',
                  style: TextStyle(fontFamily: 'Inter'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Hausaufgabe wird hochgeladen. Um sie zu sehen, musst du die App neustarten.',
                          style: TextStyle(
                              fontFamily: 'Inter'
                          ),
                        ),
                      )
                  );
                  homework.doc(homeworkUuid).set({'Content': widget.contentController.text.trim(), 'Given': widget.givenController.text.trim(), 'Id': homeworkUuid, 'Subject': widget.subjectController.text.trim()});
                  if (_noHistory == false) { history.doc(homeworkUuid).set({'Content': widget.contentController.text.trim(), 'Given': widget.givenController.text.trim(), 'Subject': widget.subjectController.text.trim()}); }
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppTheme.greyGreen),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontFamily: 'Inter'
                    ))
                ),
                child: const Text("Fertig"),
              ),
            ),
          ],
        )
    );
  }
}

class _HomeworkData {
  _HomeworkData({required this.Content, required this.Given, required this.Id, required this.Subject});

  _HomeworkData.fromJson(Map<String, Object?> json)
  : this(
    Content: json['Content']! as String,
    Given: json['Given']! as String,
    Id: json['Id']! as String,
    Subject: json['Subject']! as String
  );

  final String Content;
  final String Given;
  final String Id;
  final String Subject;
}