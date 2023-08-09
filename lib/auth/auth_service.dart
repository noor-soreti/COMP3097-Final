import 'package:firebase_auth/firebase_auth.dart';

import '../src/user_model.dart';

class AuthService {
// Firebase authentication instance to communicate with Firebase Auth backend
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel?> get onAuthStateChanged =>
      _auth.authStateChanges().map((User? user) {
        return _userModelFromFirebase(user);
      });

  UserModel? _userModelFromFirebase(User? user) {
    if (user != null) {
      return UserModel(id: user.uid);
    } else {
      return null;
    }
  }

  User? currentUser() {
    User? u = _auth.currentUser;
    return u;
  }

  Future emailLogin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userModelFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userModelFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
