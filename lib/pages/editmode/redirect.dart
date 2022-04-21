import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hausaufgaben/pages/editmode/settings.dart';
import 'package:hausaufgaben/pages/editmode/sign_in.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  static const String routeName = '/EditPage';
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const EditModePage();
    }
    return SignInPage();
  }
}
