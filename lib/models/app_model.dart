import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'query.dart';
import 'user_settings.dart';

class AppModel extends QueryModel {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _firebaseUser;
  UserSettings userSettings = UserSettings();

  @override
  Future loadData() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    _firebaseUser =
        await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    ));

    FirebaseDatabase.instance.setPersistenceEnabled(true);
    final database = FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(_firebaseUser.uid);
    database.onValue.listen(addUser);

    setLoading(false);
  }

  void addUser(Event event) {
    userSettings = UserSettings.fromJson(
      name: _firebaseUser.displayName,
      url: _firebaseUser.photoUrl,
      email: _firebaseUser.email,
      // Esto es un poco guarreria, pero funciona
      json: event.snapshot.value[event.snapshot.value.keys.first],
    );
  }
}
