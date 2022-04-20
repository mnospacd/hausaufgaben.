import 'package:flutter/material.dart';
import 'package:hausaufgaben/pages/homework/page.dart';

import '../components/firebase/get_data.dart';
import '../components/localStorage.dart';

class IndexPage extends StatelessWidget {
  final Future _storageFuture = localStorage.init();

  IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([GetData(), _storageFuture]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting){
          return const Scaffold(
            body: Center(
                child: Text('Please wait its loading...')
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