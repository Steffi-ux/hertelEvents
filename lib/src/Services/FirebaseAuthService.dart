import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuthService(); //Konstruktor

  final auth = FirebaseAuth.instance; //auth = authentification

  logIn(String _email, String _passwort) {
    //Einloggen
    auth.signInWithEmailAndPassword(email: _email, password: _passwort);
  }

  logOut() {
    //Ausloggen
    auth.signOut();
  }

  register(String _email, String _passwort) {
    //Anmelden
    auth.createUserWithEmailAndPassword(email: _email, password: _passwort);
  }
}
