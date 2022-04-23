import 'package:flutter/material.dart';

import '../../styling.dart';

class ExamDetailsPage extends StatefulWidget {
  final String subject;
  final String given;
  final String content;
  final int index;
  const ExamDetailsPage(this.subject, this.given, this.content, this.index);

  @override
  State<ExamDetailsPage> createState() => _ExamDetailsPageState();
}

class _ExamDetailsPageState extends State<ExamDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Hero(
                    tag: "title" + widget.index.toString(),
                    child: Text(
                      widget.subject,
                      style: AppTheme.textTheme.headline4,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      iconSize: 28,
                      icon: const Icon(Icons.expand_more)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                widget.given,
                style: AppTheme.textTheme.subtitle1
              ),
            ),
            Text(
              widget.content,
              style: AppTheme.textTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
