import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hausaufgaben/components/authentication_service.dart';
import 'package:hausaufgaben/pages/editmode/homework/add.dart';
import 'package:hausaufgaben/pages/editmode/homework/remove.dart';
import 'package:hausaufgaben/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../../styling.dart';

class EditModePage extends StatelessWidget {
  const EditModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greyDarkGreen,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppTheme.greyDarkGreen
        ),
        title: Text(
          'Bearbeitungsmodus',
          style: AppTheme.textTheme.headline6,
        ),
      ),
      body:  ListView(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Hausaufgaben',
              style: AppTheme.textTheme.caption,
            ),
          ),
          ListTile(
            selectedColor: AppTheme.greyLightGreen,
            leading: const Icon(Icons.add),
            iconColor: Colors.black,
            title: Text(
                'Hinzufüge Hausaufgabe',
                style: AppTheme.textTheme.bodyText1
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditHomeworkAdd())
              );
            },
          ),
          ListTile(
            selectedColor: AppTheme.greyLightGreen,
            leading: const Icon(Icons.remove),
            iconColor: Colors.black,
            title: Text(
                'Entferne Hausaufgabe',
                style: AppTheme.textTheme.bodyText1
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditHomeworkRemove())
              );
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Account',
              style: AppTheme.textTheme.caption,
            ),
          ),
          ListTile(
            selectedColor: AppTheme.greyLightGreen,
            leading: const Icon(Icons.logout),
            iconColor: Colors.black,
            title: Text(
                'Abmelden',
                style: AppTheme.textTheme.bodyText1
            ),
            onTap: () {
              context.read<AuthenticationService>().signOut();
            },
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
