import 'package:flutter/material.dart';
import 'package:hausaufgaben/components/firebase/reset_uuids.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/pageRoute.dart';
import '../../styling.dart';

Widget NavigationDrawerTile(BuildContext context, String _page) {
  if (_page == 'homework') { return _homework(context); }
  else if (_page == 'timetable') { return  _timetable(context);}
  else if (_page == 'resetUuids') { return _resetUuids(context);}
  else if (_page == 'github') { return _github(context);}
  else if (_page == 'edit') { return _edit(context);}
  else { return const Text('Wrong list Tile specified!'); }
}

Widget _homework(BuildContext context) {
  return ListTile(
    textColor: AppTheme.white,
    iconColor: AppTheme.white,
    selectedColor: AppTheme.greyLightGreen,
    leading: const Icon(Icons.book),
    title: Text(
        'Hausaufgaben',
        style: AppTheme.textTheme.bodyText1
    ),
    selected: PageRoutes.currentRoute == PageRoutes.homework,
    onTap: () {
      if (PageRoutes.currentRoute == PageRoutes.homework) return;
      PageRoutes.currentRoute = PageRoutes.homework;

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, PageRoutes.homework);
    },
  );
}

Widget _timetable(BuildContext context) {
  return ListTile(
    textColor: AppTheme.white,
    iconColor: AppTheme.white,
    selectedColor: AppTheme.greyLightGreen,
    leading: const Icon(Icons.schedule),
    title: Text(
        'Stundenplan',
        style: AppTheme.textTheme.bodyText1
    ),
    selected: PageRoutes.currentRoute == PageRoutes.timetable,
    onTap: () {
      if (PageRoutes.currentRoute == PageRoutes.timetable) return;
      PageRoutes.currentRoute = PageRoutes.timetable;

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, PageRoutes.timetable);
      },
  );
}

Widget _resetUuids(BuildContext context) {
  return ListTile(
    textColor: AppTheme.white,
    iconColor: AppTheme.white,
    selectedColor: AppTheme.greyLightGreen,
    leading: const Icon(Icons.restart_alt),
    title: Text(
        'Reset UUIDs',
        style: AppTheme.textTheme.bodyText1
    ),
    onTap: () {
      resetUuids();
    },
  );
}

Widget _github(BuildContext context) {
  return ListTile(
    textColor: AppTheme.white,
    iconColor: AppTheme.white,
    selectedColor: AppTheme.greyLightGreen,
    leading: const Icon(Icons.code),
    title: Text(
        'Github',
        style: AppTheme.textTheme.bodyText1
    ),
    onTap: () => launch('https://github.com/Baumlaeufer0815/hausaufgaben.')
  );
}

Widget _edit(BuildContext context) {
  return ListTile(
    textColor: AppTheme.white,
    iconColor: AppTheme.white,
    selectedColor: AppTheme.greyLightGreen,
    leading: const Icon(Icons.edit),
    title: Text(
          'Bearbeitungsmodus',
          style: AppTheme.textTheme.bodyText1
      ),
    selected: PageRoutes.currentRoute == PageRoutes.edit,
    onTap: () {
      if (PageRoutes.currentRoute == PageRoutes.edit) return;
      PageRoutes.currentRoute = PageRoutes.edit;

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, PageRoutes.edit);
    },
  );
}