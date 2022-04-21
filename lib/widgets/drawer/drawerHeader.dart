import 'package:flutter/material.dart';

import '../../styling.dart';

Widget NavigationDrawerHeader() {
  return SizedBox(
    height: 82.0,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'hausaufgaben',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: AppTheme.white
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                      color: AppTheme.greyLightGreen
                    ),
                  )
                ]
              )
            ),
          ],
        ),
      ),
    );
}