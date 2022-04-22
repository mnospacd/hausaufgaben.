import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hausaufgaben/pages/homework/page.dart';

import '../components/firebase/get_data.dart';
import '../components/localStorage.dart';
import '../styling.dart';

class IndexPage extends StatelessWidget {
  final Future _storageFuture = localStorage.init();

  IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([GetData(), _storageFuture]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppTheme.greyDarkGreen,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: AppTheme.greyDarkGreen
              ),
              title: Text(
                'Laden',
                style: AppTheme.textTheme.headline6,
              ),
            ),
            body: const Center(
              child: Text(
                'Bitte warten, Daten werden abgerufen.',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter'
                ),
              ),
            ),
          );
        }else{
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                  child: Text('Error: ${snapshot.error}')
              ),
            );
          } else {
            return const HomeworkPage();
          }
        }
      },
    );
  }
}