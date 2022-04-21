import 'package:flutter/material.dart';
import 'package:hausaufgaben/components/authentication_service.dart';
import 'package:hausaufgaben/widgets/drawer.dart';
import 'package:provider/provider.dart';

class EditModePage extends StatelessWidget {
  const EditModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          context.read<AuthenticationService>().signOut();
        },
        child: const Text('Abmelden'),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
