import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hausaufgaben/components/authentication_service.dart';
import 'package:provider/provider.dart';

import '../../styling.dart';
import '../../widgets/drawer.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greyDarkGreen,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppTheme.greyDarkGreen
        ),
        title: Text(
          'Bearbeitungsmodus Anmeldung',
          style: AppTheme.textTheme.headline6,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 10),
            child: TextField(
              controller: emailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              cursorColor: AppTheme.greyGreen,
              style: const TextStyle(
                fontFamily: 'Inter'
              ),
              decoration: const InputDecoration(
                labelText: "E-Mail",
                labelStyle: TextStyle(
                  color: AppTheme.greyGreen
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
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 10),
            child: TextField(
              controller: passwordController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              cursorColor: AppTheme.greyGreen,
              style: const TextStyle(
                  fontFamily: 'Inter'
              ),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Passwort",
                labelStyle: TextStyle(
                    color: AppTheme.greyGreen
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
            padding: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim()
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppTheme.greyGreen),
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontFamily: 'Inter'
                ))
              ),
              child: Text("Login"),
            ),
          )
        ],
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
