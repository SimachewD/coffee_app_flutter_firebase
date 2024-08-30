import 'package:coffee_app_firebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object from firebase user
  UserCustom? _userFromFirebase(user) {
    return user != null ? UserCustom(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserCustom?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // Anonymous sign in
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      return e.toString();
    }
  }

//user sign in with email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case 'invalid-email':
          throw ("Invalid email");
        case 'invalid-credential':
          throw "Wrong-password";
        default:
          return 'An unknown error occurred: ${e.message}';
      }
    } catch (e) {
      throw 'Unknown Error: ${e.toString()}';
    }
  }

  //user registration
  Future registerFirebaseUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw ("Invalid email");
        case 'email-already-in-use':
          throw "Email-already-in-use";
        case 'weak-password':
          throw "Weak-password";
        default:
          return 'An unknown error occurred: ${e.message}';
      }
    } catch (e) {
      throw 'Unknown Error: ${e.toString()}';
    }
  }

  //Signout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return e.toString();
    }
  }
}
