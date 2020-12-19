import 'package:HertelEventApp/src/Screens/homeScreen.dart';
import 'package:HertelEventApp/src/Screens/verifyScreen.dart';
import 'package:HertelEventApp/src/Services/FirebaseAuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _passwort;
  FirebaseAuthService firebaseAuthService = new FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "E-Mail"),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Passwort"),
              onChanged: (value) {
                setState(() {
                  _passwort = value.trim();
                });
              },
            ),
          ),
          TextField(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //Buttons werden mittig zentriert
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text("Login"), //Button Einlogen
                onPressed: () {
                  firebaseAuthService.logIn(_email, _passwort);
                  //Springt weiter auf den HomeSreen
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text("Registrieren"),
              onPressed: () {
                firebaseAuthService.register(_email, _passwort);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => VerifyScreen()));
              },
            )
          ])
        ],
      ),
    );
  }
}
