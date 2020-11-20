import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/models/user.dart';

class AuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  UserID _userFromFirebaseUser(User user) {
    return user != null ? UserID(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = userCredential.user;
      return _userFromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.toString());
      }
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = userCredential.user;
      return _userFromFirebaseUser(firebaseUser);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print("The password is too-weak");
      } else if (e.code == 'email-already-in-use') {
        print("The email is already in use");
      } else {
        print(e.toString());
      }
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithPhone(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
