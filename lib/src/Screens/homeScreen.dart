import 'package:flutter/material.dart';
import 'package:HertelEventApp/src/Screens/loginScreen.dart';
import 'package:HertelEventApp/src/Services/FirebaseAuthService.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuthService firebaseAuthService = new FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("Logout"),
          onPressed: () {
            firebaseAuthService.logOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
    );
  }
}
